import Foundation
import SwiftUI

public extension Models {
    struct ScrollView: Identifiable, Model, Codable {
        public init(
            id: UUID = UUID(),
            axis: Axis.Set = .vertical,
            showsIndicators: Bool = true,
            content: @escaping () -> Model
        ) {
            self.id = id
            self.axis = axis
            self.showsIndicators = showsIndicators
            self.content = content().render()
        }

        public let id: UUID
        let axis: Axis.Set
        let showsIndicators: Bool
        let content: Component

        public func render() -> Component {
            Component.scrollView(self)
        }
    }
}

extension Models.ScrollView {
    struct ComponentView: View {
        init(
            _ model: Models.ScrollView,
            _ dispatch: @escaping DispatchFunction
        ) {
            self.model = model
            self.dispatch = dispatch
        }

        private let model: Models.ScrollView
        private let dispatch: DispatchFunction

        var body: some View {
            ScrollView(model.axis, showsIndicators: model.showsIndicators) {
                model.content.view(with: dispatch)
            }
        }
    }
}
