import SwiftUI

public extension Models {
    struct Divider: Identifiable, Model, Codable {
        public let id: UUID

        public init(
            id: UUID = UUID()
        ) {
            self.id = id
        }

        public func render() -> Component {
            Component.divider(self)
        }
    }
}
