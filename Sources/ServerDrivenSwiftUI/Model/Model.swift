import Foundation

public protocol ModelConvertible {
    func asModels() -> [Model]
}

public protocol Model: ModelConvertible {
    var id: UUID { get }
    func render() -> Component
}

public extension Model {
    func asModels() -> [Model] {
        return [self]
    }
}

extension Array: ModelConvertible where Element == Model {
    public func asModels() -> [Model] {
        self
    }
}


@resultBuilder
public enum ModelBuilder {
    public static func buildBlock(_ content: ModelConvertible...) -> [Model] {
        Array(
            content.map { element -> [Model] in
                element.asModels()
            }
            .flatMap { $0 }
            .prefix(9)
        )
    }

    public static func buildOptional(_ component: ModelConvertible?) -> [Model] {
        return component?.asModels() ?? []
    }

    public static func buildEither(first: ModelConvertible) -> [Model] {
        return first.asModels()
    }

    public static func buildEither(second: ModelConvertible) -> [Model] {
        return second.asModels()
    }
}
