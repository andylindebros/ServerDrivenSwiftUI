import Foundation
import SwiftUI

public extension Models {
    struct Image: Identifiable, Model, Codable {
        public init(
            id: UUID = UUID(),
            _ value: String
        ) {
            self.id = id
            self.value = .name(value)
        }

        public init(
            id: UUID = UUID(),
            systemName: String
        ) {
            self.id = id
            value = .systemName(systemName)
        }

        public let id: UUID
        var value: Property

        public func render() -> Component {
            Component.image(self)
        }
    }
}

extension Models.Image {
    enum Property: Codable {
        case name(String)
        case systemName(String)
    }

    struct ComponentView: View {
        init(_ model: Models.Image) {
            self.model = model
        }

        private let model: Models.Image

        var body: some View {
            switch model.value {
            case let .systemName(value):
                Image(systemName: value)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
            case let .name(value):
                Image(value, bundle: .module)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
}
