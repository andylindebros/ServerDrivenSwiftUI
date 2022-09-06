import Foundation
import SwiftUI

public extension Models {
    struct EdgesIgnoringSafeArea: Identifiable, Model, Codable {
        public init(id: UUID = UUID(), content: Component, edges: Edge.Set) {
            self.id = id
            self.edges = edges
            self.content = content
        }

        public let id: UUID

        let content: Component
        let edges: Edge.Set

        public func render() -> Component {
            Component.edgesIgnoringSafeArea(self)
        }
    }
}

extension Models.EdgesIgnoringSafeArea {
    struct ComponentView: View {
        init(
            _ model: Models.EdgesIgnoringSafeArea,
            _ dispatch: @escaping DispatchFunction
        ) {
            self.model = model
            self.dispatch = dispatch
        }

        private let model: Models.EdgesIgnoringSafeArea
        private let dispatch: DispatchFunction

        var body: some View {
            model.content.view(with: dispatch)
                .edgesIgnoringSafeArea(model.edges)
        }
    }
}
