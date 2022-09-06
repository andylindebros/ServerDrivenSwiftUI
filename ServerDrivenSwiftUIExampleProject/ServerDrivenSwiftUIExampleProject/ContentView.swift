import LindebrosApiClient
import ServerDrivenSwiftUI
import SwiftUI

struct ContentView: View {
    init(viewModel: ContentViewModel) {
        self.viewModel = viewModel
    }

    @ObservedObject private var viewModel: ContentViewModel
    var body: some View {
        switch viewModel.state {
        case .initLoading:
            ProgressView()
        case let .loading(isSilent):
            if isSilent {
                parseContent()
            } else {
                ProgressView()
            }
        case .loaded, .loadedMore:
            parseContent()
                .alert(isPresented: Binding(
                    get: {
                        viewModel.showAlert
                    },
                    set: { value in
                        viewModel.dispatch(.alert(shouldBePresented: value, withMessage: ""))
                    }
                )) {
                    Alert(title: Text(viewModel.alertMessage))
                }
        case let .loadingMore(isSilent):
            parseContent()
                
            if !isSilent {
                ProgressView()
            }

        case let .error(error):
            VStack(spacing: 16) {
                Image(systemName: "wifi.exclamationmark")
                    .frame(width: 40)
                    .foregroundColor(.red)
                Text(Self.errorMessage(of: error))
                    .font(.callout, color: .red)

                Button(action: {
                    Task {
                        await viewModel.load()
                    }
                }) {
                    Image(systemName: "arrow.uturn.left.circle.fill")
                        .frame(width: 20)

                    Text("Reload")
                }
            }

        case let .loadedMoreWithError(error):
            parseContent()
            Text("\(error.status.rawValue) \(Self.errorMessage(of: error))")
                .foregroundColor(.red)
        }
    }

    func parseContent() -> some View {
        ForEach(viewModel.content) { content in
            content.view(with: viewModel.dispatch)
        }
    }

    static func errorMessage(of error: Client.ErrorResponse) -> String {
        if let errorMessage = error.message {
            return errorMessage
        }
        return ""
    }
}
