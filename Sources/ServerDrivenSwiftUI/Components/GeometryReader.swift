import SwiftUI

public extension Models {
    enum CoordinateSpace: Codable {
        case global, local
        case named(String)
    }

    enum Measurement: Codable {
        case width, height, both
    }

    struct GeometryReader: Identifiable, Model, Codable {
        public let id: UUID
        let coordinateSpace: Models.CoordinateSpace
        let measurement: Models.Measurement
        let content: Component

        public init(
            id: UUID = UUID(),
            coordinateSpace: Models.CoordinateSpace,
            measurement: Models.Measurement,
            content: @escaping () -> Component
        ) {
            self.id = id
            self.coordinateSpace = coordinateSpace
            self.measurement = measurement
            self.content = content()
        }

        public func render() -> Component {
            Component.geometryReader(self)
        }
    }
}

extension Models.GeometryReader {
    struct ComponentView: View {
        init(
            _ model: Models.GeometryReader,
            _ dispatch: @escaping DispatchFunction
        ) {
            self.model = model
            self.dispatch = dispatch
        }

        private let model: Models.GeometryReader
        private let dispatch: DispatchFunction

        func frame(from proxy: GeometryProxy) -> CGRect {
            switch model.coordinateSpace {
            case .global:
                return proxy.frame(in: .global)
            case .local:
                return proxy.frame(in: .local)
            case let .named(namespace):
                return proxy.frame(in: .named(namespace))
            }
        }

        @ViewBuilder func setSize<Content: View>(
            from proxy: GeometryProxy,
            @ViewBuilder content: @escaping () -> Content
        ) -> some View {
            switch model.measurement {
            case .width:
                content().frame(width: frame(from: proxy).size.width)
            case .height:
                content().frame(height: frame(from: proxy).size.height)
            case .both:
                content().frame(width: frame(from: proxy).size.width, height: frame(from: proxy).size.height)
            }
        }

        var body: some View {
            GeometryReader { proxy in
                setSize(from: proxy) {
                    model.content.view(with: dispatch)
                }
            }
        }
    }
}
