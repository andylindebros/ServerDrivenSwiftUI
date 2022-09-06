import Foundation
import SwiftUI

public extension Models {
    struct Text: Identifiable, Model, Codable {
        public init(
            id: UUID = UUID(),
            _ value: String
        ) {
            self.id = id
            self.value = value
        }

        public let id: UUID
        var value: String

        public func render() -> Component {
            Component.text(self)
        }

        public func update(value: String) -> Component {
            var model = self
            model.value = value
            return Component.text(model)
        }
    }
}

extension Models.Text {
    struct ComponentView: View {
        init(model: Models.Text) {
            self.model = model
        }

        private let model: Models.Text

        var body: some View {
            Text(model.value)
        }
    }
}
