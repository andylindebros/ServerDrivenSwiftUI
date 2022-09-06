import Foundation
import SwiftUI

public extension Model {
    func background(_ modifierContent: Model) -> Model {
        Models.Background(content: render(), modifierContent: modifierContent)
    }

    func frame(minWidth: CGFloat? = nil, idealWidth: CGFloat? = nil, maxWidth: CGFloat? = nil, minHeight: CGFloat? = nil, idealHeight: CGFloat? = nil, maxHeight: CGFloat? = nil, alignment: Alignment = .center) -> Model {
        Models.Frame(content: render(), minWidth: minWidth, idealWidth: idealWidth, maxWidth: maxWidth, minHeight: minHeight, idealHeight: idealHeight, maxHeight: maxHeight, alignment: alignment)
    }

    func frame(width: CGFloat? = nil, height: CGFloat? = nil, alignment: Alignment = .center) -> Model {
        Models.Frame(content: render(), width: width, height: height, alignment: alignment)
    }

    func padding(_ edges: Edge.Set, _ value: CGFloat = 5) -> Model {
        Models.Padding(content: render(), edges: edges, value: value)
    }

    func font(_ font: FontType, color: ColorType = .black) -> Model {
        Models.Font(content: render(), font: font, color: color)
    }

    func foregroundColor(_ color: ColorType) -> Model {
        Models.ForegroundColor(content: render(), color: color)
    }

    func fixedSize(horizontal: Bool = true, vertical: Bool = true) -> Model {
        Models.FixedSize(content: render(), horizontal: horizontal, vertical: vertical)
    }

    func multilineTextAlignment(_ textAlignment: TextAlignment) -> Model {
        Models.MultilineTextAlignment(content: render(), textAlignment: textAlignment)
    }

    func lineLimit(_ lineLimit: Int) -> Model {
        Models.LineLimit(content: render(), lineLimit: lineLimit)
    }

    func navigationTitle(_ title: String) -> Model {
        Models.NavigationTitle(content: render(), title: title)
    }

    func coordinateSpace(name: String) -> Model {
        Models.CoordinateSpaceModifier(content: render(), name: name)
    }

    func onAppear(id: UUID = UUID(), _ action: Action) -> Model {
        Models.OnAppear(id: id, content: render(), action: action)
    }

    func onDisappear(_ action: Action) -> Model {
        Models.OnDisappear(content: render(), action: action)
    }

    func overlay(_ modifierContent: Model) -> Model {
        Models.Overlay(content: render(), modifierContent: modifierContent)
    }

    func onTapGesture(_ action: Action) -> Model {
        Models.OnTapGesture(content: render(), action: action)
    }

    func cornerRadius(_ value: CGFloat) -> Model {
        Models.CornerRadius(content: render(), value: value)
    }
    
    func edgesIgnoringSafeArea(_ value: Edge.Set) -> Model {
        Models.EdgesIgnoringSafeArea(content: render(), edges: value)
    }
}

