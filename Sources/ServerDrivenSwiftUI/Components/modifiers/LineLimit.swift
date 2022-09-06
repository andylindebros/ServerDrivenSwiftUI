import Foundation
import SwiftUI

public extension Models {
    struct LineLimit: Identifiable, Model, Codable {
        public init(id: UUID = UUID(), content: Component, lineLimit: Int) {
            self.id = id
            self.content = content
            self.lineLimit = lineLimit
        }

        public let id: UUID
        let content: Component
        let lineLimit: Int

        public func render() -> Component {
            Component.lineLimit(self)
        }
    }
}

extension Models.LineLimit {
    struct ComponentView: View {
        init(
            _ model: Models.LineLimit,
            _ dispatch: @escaping DispatchFunction
        ) {
            self.model = model
            self.dispatch = dispatch
        }

        private let model: Models.LineLimit
        private let dispatch: DispatchFunction

        var body: some View {
            model.content.view(with: dispatch)
                .lineLimit(model.lineLimit)
        }
    }
}
