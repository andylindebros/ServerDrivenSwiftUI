import Foundation
import SwiftUI

public extension Models {
    struct OnAppear: Identifiable, Model, Codable {
        public init(id: UUID = UUID(), content: Component, action: Action) {
            self.id = id
            self.content = content
            self.action = action
        }

        public let id: UUID
        let content: Component
        let action: Action

        public func render() -> Component {
            Component.onAppear(self)
        }
    }
}

extension Models.OnAppear {
    struct ComponentView: View {
        init(
            _ model: Models.OnAppear,
            _ dispatch: @escaping DispatchFunction
        ) {
            self.model = model
            self.dispatch = dispatch
        }

        private let model: Models.OnAppear
        private let dispatch: DispatchFunction

        var body: some View {
            model.content.view(with: dispatch)
                .onAppear {
                    dispatch(model.action)
                }
        }
    }
}
