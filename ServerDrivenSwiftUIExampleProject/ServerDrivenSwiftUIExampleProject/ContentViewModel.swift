import Foundation
import LindebrosApiClient
import ServerDrivenSwiftUI
import SwiftUI

class ContentViewModel: ObservableObject {
    @Published private(set) var state: ViewState = .initLoading
    @Published private(set) var content: [Component] = []
    @Published private(set) var showAlert = false

    private(set) var alertMessage = ""

    init() {
        Task {
            await load()
        }
    }

    @MainActor func load() async {
        do {
            state = .loading(isSilent: false)
            guard
                let response: [Component] = try await Client(
                    configuration: .init(
                        baseURL: URL(
                            string: "http://localhost:8080"
                        )!
                    )
                ).get("\(ServerDrivenSwiftUI.packageVersion)/helloworld").dispatch()
            else {
                throw Client.ErrorResponse(message: "Could not parse the response", status: .internalServerError)
            }

            content = response
            state = .loaded
        } catch let error as Client.ErrorResponse {
            if error.status == .gone {
                state = .error(Client.ErrorResponse(message: "You need to update your app", status: .gone))
                return
            }
            state = .error(error)
        } catch {
            state = .error(Client.ErrorResponse(message: error.localizedDescription, status: .unknown))
        }
    }

    func dispatch(_ action: Action) {
        switch action {
        case let .alert(showAlert, alertMessage):
            self.alertMessage = alertMessage
            self.showAlert = showAlert
        case .reload:
            Task {
                await load()
            }
        }
    }
}
