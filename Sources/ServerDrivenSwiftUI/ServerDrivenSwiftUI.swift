import Foundation
import SwiftUI

public let packageVersion = "1.0"
public let key = "abc"

public enum Models {
    enum Modifiers {}
}

public indirect enum Component: Identifiable, Codable {
    case text(Models.Text)
    case button(Models.Button)
    case vStack(Models.VStack)
    case hStack(Models.HStack)
    case color(Models.Color)
    case background(Models.Background)
    case frame(Models.Frame)
    case padding(Models.Padding)
    case font(Models.Font)
    case foregroundColor(Models.ForegroundColor)
    case fixedSize(Models.FixedSize)
    case spacer(Models.Spacer)
    case divider(Models.Divider)
    case multilineTextAlignment(Models.MultilineTextAlignment)
    case lineLimit(Models.LineLimit)
    case navigationTitle(Models.NavigationTitle)
    case scrollView(Models.ScrollView)
    case lazyVStack(Models.LazyVStack)
    case geometryReader(Models.GeometryReader)
    case zStack(Models.ZStack)
    case coordinateSpace(Models.CoordinateSpaceModifier)
    case onAppear(Models.OnAppear)
    case onDisappear(Models.OnDisappear)
    case overlay(Models.Overlay)
    case onTapGesture(Models.OnTapGesture)
    case cornerRadius(Models.CornerRadius)
    case edgesIgnoringSafeArea(Models.EdgesIgnoringSafeArea)
    case image(Models.Image)

    public var id: UUID {
        switch self {
        case let .text(model):
            return model.id
        case let .button(model):
            return model.id
        case let .vStack(model):
            return model.id
        case let .hStack(model):
            return model.id
        case let .background(model):
            return model.id
        case let .scrollView(model):
            return model.id
        case let .lazyVStack(model):
            return model.id
        case let .geometryReader(model):
            return model.id
        case let .zStack(model):
            return model.id
        case let .overlay(model):
            return model.id
        case let .onTapGesture(model):
            return model.id
        case let .color(model):
            return model.id
        case let .frame(model):
            return model.id
        case let .padding(model):
            return model.id
        case let .font(model):
            return model.id
        case let .foregroundColor(model):
            return model.id
        case let .fixedSize(model):
            return model.id
        case let .spacer(model):
            return model.id
        case let .divider(model):
            return model.id
        case let .multilineTextAlignment(model):
            return model.id
        case let .lineLimit(model):
            return model.id
        case let .navigationTitle(model):
            return model.id
        case let .coordinateSpace(model):
            return model.id
        case let .onAppear(model):
            return model.id
        case let .onDisappear(model):
            return model.id
        case let .cornerRadius(model):
            return model.id
        case let .edgesIgnoringSafeArea(model):
            return model.id
        case let .image(model):
            return model.id
        }
    }

    @ViewBuilder public func view(
        with dispatch: @escaping DispatchFunction
    ) -> some View {
        switch self {
        case let .text(model):
            Models.Text.ComponentView(model: model)
        case let .button(model):
            Models.Button.ComponentView(model: model, dispatch: dispatch)
        case let .vStack(model):
            Models.VStack.ComponentView(model, dispatch)
        case let .hStack(model):
            Models.HStack.ComponentView(model, dispatch)
        case let .color(model):
            model.color.color
        case let .background(model):
            Models.Background.ComponentView(model, dispatch)
        case let .frame(model):
            Models.Frame.ComponentView(model, dispatch)
        case let .padding(model):
            Models.Padding.ComponentView(model, dispatch)
        case let .font(model):
            Models.Font.ComponentView(model, dispatch)
        case let .foregroundColor(model):
            Models.ForegroundColor.ComponentView(model, dispatch)
        case let .fixedSize(model):
            Models.FixedSize.ComponentView(model, dispatch)
        case .spacer:
            Spacer()
        case .divider:
            Divider()
        case let .multilineTextAlignment(model):
            Models.MultilineTextAlignment.ComponentView(model, dispatch)
        case let .lineLimit(model):
            Models.LineLimit.ComponentView(model, dispatch)
        case let .navigationTitle(model):
            Models.NavigationTitle.ComponentView(model, dispatch)
        case let .scrollView(model):
            Models.ScrollView.ComponentView(model, dispatch)
        case let .lazyVStack(model):
            Models.LazyVStack.ComponentView(model, dispatch)
        case let .geometryReader(model):
            Models.GeometryReader.ComponentView(model, dispatch)
        case let .zStack(model):
            Models.ZStack.ComponentView(model, dispatch)
        case let .coordinateSpace(model):
            Models.CoordinateSpaceModifier.ComponentView(model, dispatch)
        case let .onAppear(model):
            Models.OnAppear.ComponentView(model, dispatch)
        case let .onDisappear(model):
            Models.OnDisappear.ComponentView(model, dispatch)
        case let .overlay(model):
            Models.Overlay.ComponentView(model, dispatch)
        case let .onTapGesture(model):
            Models.OnTapGesture.ComponentView(model, dispatch)
        case let .cornerRadius(model):
            Models.CornerRadius.ComponentView(model, dispatch)
        case let .edgesIgnoringSafeArea(model):
            Models.EdgesIgnoringSafeArea.ComponentView(model, dispatch)
        case let .image(model):
            Models.Image.ComponentView(model)
        }
    }
}
