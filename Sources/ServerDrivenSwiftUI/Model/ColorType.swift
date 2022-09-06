import SwiftUI

public enum ColorType: String, Codable {
    case white, black, green, blue, yellow, orange, red, pink, clear, gray

    public var color: Color {
        switch self {
        case .white:
            return .white
        case .black:
            return .black
        case .green:
            return .green
        case .blue:
            return .blue
        case .yellow:
            return .yellow
        case .orange:
            return .orange
        case .red:
            return .red
        case .pink:
            return .pink
        case .clear:
            return .clear
        case .gray:
            return .gray
        }
    }
}
