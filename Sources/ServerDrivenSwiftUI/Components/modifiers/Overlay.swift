import Foundation
import SwiftUI

public extension Models {
    struct Overlay: Identifiable, Model, Codable {
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
            Component.overlay(self)
        }
    }
}

extension Models.Overlay {
    struct ComponentView: View {
        init(
            _ model: Models.Overlay,
            _ dispatch: @escaping DispatchFunction
        ) {
            self.model = model
            self.dispatch = dispatch
        }

        private let model: Models.Overlay
        private let dispatch: DispatchFunction

        var body: some View {
            model.content.view(with: dispatch)
                .overlay(model.modifierComponent.view(with: dispatch))
        }
    }
}
