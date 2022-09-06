import Foundation
import SwiftUI

public extension Models {
    struct Button: Identifiable, Model, Codable {
        public init(
            id: UUID = UUID(),
            action: Action,
            content: @escaping () -> Model
        ) {
            self.id = id
            self.content = content().render()
            self.action = action
        }

        public let id: UUID
        let content: Component
        let action: Action

        public func render() -> Component {
            Component.button(self)
        }
    }
}

extension Models.Button {
    struct ComponentView: View {
        init(model: Models.Button, dispatch: @escaping DispatchFunction) {
            self.model = model
            self.dispatch = dispatch
        }

        private let model: Models.Button
        private let dispatch: DispatchFunction

        var body: some View {
            Button(action: {
                dispatch(model.action)
            }) {
                model.content.view(with: dispatch)
            }
        }
    }
}
