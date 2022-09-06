import LindebrosApiClient

public enum ViewState: Codable {
    case initLoading
    case loading(isSilent: Bool)
    case loaded
    case error(Client.ErrorResponse)
    case loadingMore(isSilent: Bool)
    case loadedMore
    case loadedMoreWithError(Client.ErrorResponse)
    
    var description: String {
        switch self {
        case .initLoading:
            return "🚧 initialLoading"
        case let .loading(isSilent):
            return "🚧 loading, isSilent: \(isSilent)"
        case .loaded:
            return "✅ loaded"
        case .loadedMore:
            return "✅ loadedMore"
        case let .error(err):
            return "❌ error \(err.status.rawValue) \(err.message ?? err.localizedDescription)"
        case let .loadingMore(isSilent):
            return "🚧 loading more, isSilent: \(isSilent)"
        case let .loadedMoreWithError(err):
            return "❌ loaded more with error \(err.status.rawValue) \(err.message ?? err.localizedDescription)"
        }
    }
}
