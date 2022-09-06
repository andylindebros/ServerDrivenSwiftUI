import Foundation
import SwiftUI

public extension Models {
    struct Background: Identifiable, Model, Codable {
        public init(
            id: UUID = UUID(),
            content: Component,
            modifierContent: Model
        ) {
            self.id = id
            self.content = content
            modifierComponent = modifierContent.render()
        }

        public var id: UUID
        let content: Component
        let modifierComponent: Component

        public func render() -> Component {
            Component.background(self)
        }
    }
}

extension Models.Background {
    struct ComponentView: View {
        init(
            _ model: Models.Background,
            _ dispatch: @escaping DispatchFunction
        ) {
            self.model = model
            self.dispatch = dispatch
        }

        private let model: Models.Background
        private let dispatch: DispatchFunction

        var body: some View {
            model.content.view(with: dispatch)
                .background(model.modifierComponent.view(with: dispatch))
        }
    }
}
