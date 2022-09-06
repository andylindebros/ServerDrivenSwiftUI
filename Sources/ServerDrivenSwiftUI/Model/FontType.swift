import Foundation
import SwiftUI

public enum FontType: String, Codable {
    case callout, caption, caption2, footnote, headline
    case largeTitle, subheadline, title, title2, title3

    public var font: Font {
        switch self {
        case .callout:
            return .callout
        case .caption:
            return .caption
        case .caption2:
            return .caption2
        case .footnote:
            return .footnote
        case .headline:
            return .headline
        case .largeTitle:
            return .largeTitle
        case .subheadline:
            return .subheadline
        case .title:
            return .title
        case .title2:
            return .title2
        case .title3:
            return .title3
        }
    }
}


public extension View {
    func font(_ font: Font, color: Color) -> some View {
        self.font(font).foregroundColor(color)
    }
}
