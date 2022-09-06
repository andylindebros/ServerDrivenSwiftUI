
import SwiftUI

public extension Models {
    struct ZStack: Identifiable, Model, Codable {
        public let id: UUID
        let alignment: Alignment
        let components: [Component]

        public init(
            id: UUID = UUID(),
            alignment: Alignment = .center,
            @ModelBuilder models: @escaping () -> [Model]
        ) {
            self.id = id
            self.alignment = alignment
            self.components = models().map{ $0.render() }
        }

        public func render() -> Component {
            Component.zStack(self)
        }
    }
}

extension Models.ZStack {
    struct ComponentView: View {
        init(
            _ model: Models.ZStack,
            _ dispatch: @escaping DispatchFunction
        ) {
            self.model = model
            self.dispatch = dispatch
        }

        private let model: Models.ZStack
        private let dispatch: DispatchFunction

        var body: some View {
            ZStack(alignment: model.alignment) {
                ForEach(model.components) { component in
                    component.view(with: dispatch)
                }
            }
        }
    }
}
