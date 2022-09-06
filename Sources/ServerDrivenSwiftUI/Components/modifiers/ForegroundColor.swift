import Foundation
import SwiftUI

public extension Models {
    struct ForegroundColor: Identifiable, Model, Codable {
        public init(id: UUID = UUID(), content: Component, color: ColorType) {
            self.id = id
            self.content = content
            self.color = color
        }

        public let id: UUID
        let content: Component
        let color: ColorType

        public func render() -> Component {
            Component.foregroundColor(self)
        }
    }
}

extension Models.ForegroundColor {
    struct ComponentView: View {
        init(
            _ model: Models.ForegroundColor,
            _ dispatch: @escaping DispatchFunction
        ) {
            self.model = model
            self.dispatch = dispatch
        }

        private let model: Models.ForegroundColor
        private let dispatch: DispatchFunction

        var body: some View {
            model.content.view(with: dispatch)
                .foregroundColor(model.color.color)
        }
    }
}
