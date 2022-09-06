import Foundation
import SwiftUI

public extension Models {
    struct CornerRadius: Identifiable, Model, Codable {
        public init(id: UUID = UUID(), content: Component, value: CGFloat) {
            self.id = id
            self.value = value
            self.content = content
        }

        public let id: UUID

        let content: Component
        let value: CGFloat

        public func render() -> Component {
            Component.cornerRadius(self)
        }
    }
}

extension Models.CornerRadius {
    struct ComponentView: View {
        init(
            _ model: Models.CornerRadius,
            _ dispatch: @escaping DispatchFunction
        ) {
            self.model = model
            self.dispatch = dispatch
        }

        private let model: Models.CornerRadius
        private let dispatch: DispatchFunction

        var body: some View {
            model.content.view(with: dispatch)
                .cornerRadius(model.value)
        }
    }
}
