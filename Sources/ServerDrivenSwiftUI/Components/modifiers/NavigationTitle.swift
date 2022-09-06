import Foundation
import SwiftUI

public extension Models {
    struct NavigationTitle: Identifiable, Model, Codable {
        public init(id: UUID = UUID(), content: Component, title: String) {
            self.id = id
            self.content = content
            self.title = title
        }

        public let id: UUID
        let content: Component
        let title: String

        public func render() -> Component {
            Component.navigationTitle(self)
        }
    }
}

extension Models.NavigationTitle {
    struct ComponentView: View {
        init(
            _ model: Models.NavigationTitle,
            _ dispatch: @escaping DispatchFunction
        ) {
            self.model = model
            self.dispatch = dispatch
        }

        private let model: Models.NavigationTitle
        private let dispatch: DispatchFunction

        var body: some View {
            model.content.view(with: dispatch)
                .navigationTitle(model.title)
        }
    }
}
