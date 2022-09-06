import SwiftUI

public extension Models {
    struct LazyVStack: Identifiable, Model, Codable {
        public let id: UUID
        let alignment: HorizontalAlignment
        let spacing: CGFloat
        let component: Component

        public init(
            id: UUID = UUID(),
            alignment: HorizontalAlignment = .center,
            spacing: CGFloat = .zero,
            content: @escaping () -> Model
        ) {
            self.id = id
            self.alignment = alignment
            self.spacing = spacing
            component = content().render()
        }

        public func render() -> Component {
            Component.lazyVStack(self)
        }
    }
}

extension Models.LazyVStack {
    struct ComponentView: View {
        init(
            _ model: Models.LazyVStack,
            _ dispatch: @escaping DispatchFunction
        ) {
            self.model = model
            self.dispatch = dispatch
        }

        private let model: Models.LazyVStack
        private let dispatch: DispatchFunction

        var body: some View {
            LazyVStack(alignment: model.alignment, spacing: model.spacing) {
                model.component.view(with: dispatch)
            }
        }
    }
}
