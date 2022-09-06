import Foundation
import SwiftUI

public extension Models {
    struct MultilineTextAlignment: Identifiable, Model, Codable {
        public init(id: UUID = UUID(), content: Component, textAlignment: TextAlignment) {
            self.id = id
            self.content = content
            self.textAlignment = textAlignment
        }

        public let id: UUID
        let content: Component
        let textAlignment: TextAlignment

        public func render() -> Component {
            Component.multilineTextAlignment(self)
        }
    }
}

extension Models.MultilineTextAlignment {
    struct ComponentView: View {
        init(
            _ model: Models.MultilineTextAlignment,
            _ dispatch: @escaping DispatchFunction
        ) {
            self.model = model
            self.dispatch = dispatch
        }

        private let model: Models.MultilineTextAlignment
        private let dispatch: DispatchFunction

        var body: some View {
            model.content.view(with: dispatch)
                .multilineTextAlignment(model.textAlignment)
        }
    }
}
