import Foundation
import SwiftUI

public extension Models {
    struct Padding: Identifiable, Model, Codable {
        public init(id: UUID = UUID(), content: Component, edges: Edge.Set, value: CGFloat) {
            self.id = id
            self.content = content
            self.edges = edges
            self.value = value
        }

        public let id: UUID
        let content: Component
        let edges: Edge.Set
        let value: CGFloat

        public func render() -> Component {
            Component.padding(self)
        }
    }
}

extension Models.Padding {
    struct ComponentView: View {
        init(
            _ model: Models.Padding,
            _ dispatch: @escaping DispatchFunction
        ) {
            self.model = model
            self.dispatch = dispatch
        }

        private let model: Models.Padding
        private let dispatch: DispatchFunction

        var body: some View {
            model.content.view(with: dispatch)
                .padding(model.edges, model.value)
        }
    }
}
