import Foundation
import SwiftUI

public extension Models {
    struct FixedSize: Identifiable, Model, Codable {
        public init(id: UUID = UUID(), content: Component, horizontal: Bool, vertical: Bool) {
            self.id = id
            self.content = content
            self.horizontal = horizontal
            self.vertical = vertical
        }

        public let id: UUID
        let content: Component
        let horizontal: Bool
        let vertical: Bool

        public func render() -> Component {
            Component.fixedSize(self)
        }
    }
}

extension Models.FixedSize {
    struct ComponentView: View {
        init(
            _ model: Models.FixedSize,
            _ dispatch: @escaping DispatchFunction
        ) {
            self.model = model
            self.dispatch = dispatch
        }

        private let model: Models.FixedSize
        private let dispatch: DispatchFunction

        var body: some View {
            model.content.view(with: dispatch)
                .fixedSize(horizontal: model.horizontal, vertical: model.vertical)
        }
    }
}
