import Foundation
import SwiftUI

public extension Models {
    struct CoordinateSpaceModifier: Identifiable, Model, Codable {
        public init(id: UUID = UUID(), content: Component, name: String) {
            self.id = id
            self.content = content
            self.name = name
        }

        public let id: UUID
        let content: Component
        let name: String

        public func render() -> Component {
            Component.coordinateSpace(self)
        }
    }
}

extension Models.CoordinateSpaceModifier {
    struct ComponentView: View {
        init(
            _ model: Models.CoordinateSpaceModifier,
            _ dispatch: @escaping DispatchFunction
        ) {
            self.model = model
            self.dispatch = dispatch
        }

        private let model: Models.CoordinateSpaceModifier
        private let dispatch: DispatchFunction

        var body: some View {
            model.content.view(with: dispatch)
                .coordinateSpace(name: model.name)
        }
    }
}
