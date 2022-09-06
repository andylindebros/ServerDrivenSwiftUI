import SwiftUI

public extension Models {
    struct VStack: Identifiable, Model, Codable {
        public let id: UUID
        let alignment: HorizontalAlignment
        let spacing: CGFloat
        let components: [Component]

        public init(
            id: UUID = UUID(),
            alignment: HorizontalAlignment = .center,
            spacing: CGFloat = .zero,
            @ModelBuilder models: @escaping () -> [Model]
        ) {
            self.id = id
            self.alignment = alignment
            self.spacing = spacing
            components = models().map { $0.render() }
        }

        public func render() -> Component {
            Component.vStack(self)
        }
    }
}

extension Models.VStack {
    struct ComponentView: View {
        init(
            _ model: Models.VStack,
            _ dispatch: @escaping DispatchFunction
        ) {
            self.model = model
            self.dispatch = dispatch
        }

        private let model: Models.VStack
        private let dispatch: DispatchFunction

        var body: some View {
            VStack(alignment: model.alignment, spacing: model.spacing) {
                ForEach(model.components) { component in
                    component.view(with: dispatch)
                }
            }
        }
    }
}
