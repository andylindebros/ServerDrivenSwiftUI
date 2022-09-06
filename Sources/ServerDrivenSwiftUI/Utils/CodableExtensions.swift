import Foundation
import SwiftUI

extension Edge.Set: Codable {}
extension Axis.Set: Codable {}

extension TextAlignment: Codable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .leading:
            try container.encode(CodingKeys.leading.rawValue, forKey: .leading)
        case .center:
            try container.encode(CodingKeys.center.rawValue, forKey: .center)
        case .trailing:
            try container.encode(CodingKeys.trailing.rawValue, forKey: .trailing)
        }
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let key = container.allKeys.first

        switch key {
        case .leading:
            self = .leading
        case .center, .none:
            self = .center
        case .trailing:
            self = .trailing
        }
    }

    enum CodingKeys: String, CodingKey {
        case leading, center, trailing
    }
}

extension HorizontalAlignment: Codable {
    enum CodingKeys: String, CodingKey {
        case leading, center, trailing
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .leading:
            try container.encode(CodingKeys.leading.rawValue, forKey: .leading)
        case .trailing:
            try container.encode(CodingKeys.trailing.rawValue, forKey: .trailing)
        default:
            try container.encode(CodingKeys.center.rawValue, forKey: .center)
        }
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let key = container.allKeys.first

        switch key {
        case .leading:
            self = .leading
        case .center, .none:
            self = .center
        case .trailing:
            self = .trailing
        }
    }
}

extension VerticalAlignment: Codable {
    enum CodingKeys: String, CodingKey {
        case top, center, bottom
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .top:
            try container.encode(CodingKeys.top.rawValue, forKey: .top)
        case .bottom:
            try container.encode(CodingKeys.bottom.rawValue, forKey: .bottom)
        default:
            try container.encode(CodingKeys.center.rawValue, forKey: .center)
        }
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let key = container.allKeys.first

        switch key {
        case .top:
            self = .top
        case .center, .none:
            self = .center
        case .bottom:
            self = .bottom
        }
    }
}

extension Alignment: Codable {
    enum CodingKeys: String, CodingKey {
        case top, center, bottom, leading, trailing
        case topLeading, topTrailing
        case bottomLeading, bottomTrailing
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .top:
            try container.encode(CodingKeys.top.rawValue, forKey: .top)
        case .bottom:
            try container.encode(CodingKeys.bottom.rawValue, forKey: .bottom)
        case .leading:
            try container.encode(CodingKeys.leading.rawValue, forKey: .leading)
        case .trailing:
            try container.encode(CodingKeys.trailing.rawValue, forKey: .trailing)
        case .topLeading:
            try container.encode(CodingKeys.topLeading.rawValue, forKey: .topLeading)
        case .topTrailing:
            try container.encode(CodingKeys.topTrailing.rawValue, forKey: .topTrailing)
        case .bottomLeading:
            try container.encode(CodingKeys.bottomLeading.rawValue, forKey: .bottomLeading)
        case .bottomTrailing:
            try container.encode(CodingKeys.bottomTrailing.rawValue, forKey: .bottomTrailing)
        default:
            try container.encode(CodingKeys.center.rawValue, forKey: .center)
        }
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let key = container.allKeys.first

        switch key {
        case .top:
            self = .top
        case .center, .none:
            self = .center
        case .bottom:
            self = .bottom
        case .leading:
            self = .leading
        case .trailing:
            self = .trailing
        case .topLeading:
            self = .topLeading
        case .topTrailing:
            self = .topTrailing
        case .bottomLeading:
            self = .bottomLeading
        case .bottomTrailing:
            self = .bottomTrailing
        }
    }
}
