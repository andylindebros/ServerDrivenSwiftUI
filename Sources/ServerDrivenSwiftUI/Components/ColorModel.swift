import SwiftUI

public extension Models {
    struct Color: Identifiable, Model, Codable {
        public let id: UUID
        public let color: ColorType

        public init(
            id: UUID = UUID(),
            _ color: ColorType
        ) {
            self.id = id
            self.color = color
        }

        public func render() -> Component {
            Component.color(self)
        }
    }
}
