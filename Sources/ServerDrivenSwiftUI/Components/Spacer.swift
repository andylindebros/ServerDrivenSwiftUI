import SwiftUI

public extension Models {
    struct Spacer: Identifiable, Model, Codable {
        public let id: UUID

        public init(
            id: UUID = UUID()
        ) {
            self.id = id
        }

        public func render () -> Component {
            Component.spacer(self)
        }
    }
}
