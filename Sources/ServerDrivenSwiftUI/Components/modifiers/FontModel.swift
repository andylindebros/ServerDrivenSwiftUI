import Foundation
import SwiftUI

public extension Models {
    struct Font: Identifiable, Model, Codable {
        public init(id: UUID = UUID(), content: Component, font: FontType, color: ColorType) {
            self.id = id
            self.content = content
            self.font = font
            self.color = color
        }

        public let id: UUID
        let content: Component
        let font: FontType
        let color: ColorType

        public func render() -> Component {
            Component.font(self)
        }
    }
}

extension Models.Font {
    struct ComponentView: View {
        init(
            _ model: Models.Font,
            _ dispatch: @escaping DispatchFunction
        ) {
            self.model = model
            self.dispatch = dispatch
        }

        private let model: Models.Font
        private let dispatch: DispatchFunction

        var body: some View {
            model.content.view(with: dispatch)
                .font(model.font.font, color: model.color.color)
        }
    }
}
