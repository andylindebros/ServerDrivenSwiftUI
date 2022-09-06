import Foundation
import SwiftUI

public extension Models {
    struct Frame: Identifiable, Model, Codable {
        public init(
            id: UUID = UUID(),
            content: Component,
            width: CGFloat? = nil,
            height: CGFloat? = nil,
            minWidth: CGFloat? = nil,
            idealWidth: CGFloat? = nil,
            maxWidth: CGFloat? = nil,
            minHeight: CGFloat? = nil,
            idealHeight: CGFloat? = nil,
            maxHeight: CGFloat? = nil,
            alignment: Alignment = .center
        ) {
            self.id = id
            self.content = content
            self.width = width
            self.height = height
            self.minWidth = minWidth
            self.idealWidth = idealWidth
            self.maxWidth = maxWidth
            self.minHeight = minHeight
            self.idealHeight = idealHeight
            self.maxHeight = maxHeight
            self.alignment = alignment
        }

        public let id: UUID
        let content: Component
        let width: CGFloat?
        let height: CGFloat?
        let minWidth: CGFloat?
        let idealWidth: CGFloat?
        let maxWidth: CGFloat?
        let minHeight: CGFloat?
        let idealHeight: CGFloat?
        let maxHeight: CGFloat?
        let alignment: Alignment

        var hasSolidWidthOrHeight: Bool {
            width != nil || height != nil
        }

        public func render() -> Component {
            Component.frame(self)
        }
    }
}

extension Models.Frame {
    struct ComponentView: View {
        init(
            _ model: Models.Frame,
            _ dispatch: @escaping DispatchFunction
        ) {
            self.model = model
            self.dispatch = dispatch
        }

        private let model: Models.Frame
        private let dispatch: DispatchFunction

        var body: some View {
            model.content.view(with: dispatch)
                .if(model.hasSolidWidthOrHeight) { view in
                    view.frame(width: model.width, height: model.height, alignment: model.alignment)
                }
                .if(!model.hasSolidWidthOrHeight) { view in
                    view.frame(
                        minWidth: model.minWidth,
                        idealWidth: model.idealWidth,
                        maxWidth: model.maxWidth,
                        minHeight: model.minHeight,
                        idealHeight: model.idealHeight,
                        maxHeight: model.maxHeight,
                        alignment: model.alignment
                    )
                }
        }
    }
}
