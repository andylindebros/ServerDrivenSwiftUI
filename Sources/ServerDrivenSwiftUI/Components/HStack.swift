import SwiftUI

public extension Models {
    struct HStack: Identifiable, Model, Codable {
        public let id: UUID
        let alignment: VerticalAlignment
        let spacing: CGFloat
        let content: [Component]

        public init(
            id: UUID = UUID(),
            alignment: VerticalAlignment = .center,
            spacing: CGFloat = .zero,
            @ModelBuilder models: @escaping () -> [Model]
        ) {
            self.id = id
            self.alignment = alignment
            self.spacing = spacing
            content = models().compactMap { $0.render() }
        }

        public func render() -> Component {
            Component.hStack(self)
        }
    }
}

extension Models.HStack {
    struct ComponentView: View {
        init(
            _ model: Models.HStack,
            _ dispatch: @escaping DispatchFunction
        ) {
            self.model = model
            self.dispatch = dispatch
        }

        private let model: Models.HStack
        private let dispatch: DispatchFunction

        var body: some View {
            HStack(alignment: model.alignment, spacing: model.spacing) {
                ForEach(model.content) { component in
                    component.view(with: dispatch)
                }
            }
        }
    }
}
