import Foundation


public typealias DispatchFunction = (Action) -> Void

public enum Action: Codable {
    case alert(shouldBePresented: Bool, withMessage: String)
    case reload
}
