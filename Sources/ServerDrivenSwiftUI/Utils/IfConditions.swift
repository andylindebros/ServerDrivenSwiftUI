import SwiftUI

public extension View {
    /**
     Applies the given transform if the given condition evaluates to `true`.
     - parameter condition: The condition to evaluate
     - parameter transform: The transform to apply to the source `View`
     returns: Either the original `View` or the modified `View` if the condition is `true`.
     */
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }

    /**
     Applies the given transform function if the given model is not nil.
     - parameter model: The model to evaluate
     - parameter transform: The transform to apply to the source `View`
     returns: Either the original `View` or the modified `View` if the model is not nil.
     */
    @ViewBuilder func `guard`<Model, Content: View>(_ model: Model?, transform: (Model, Self) -> Content) -> some View {
        if let model = model {
            transform(model, self)
        } else {
            self
        }
    }
}
