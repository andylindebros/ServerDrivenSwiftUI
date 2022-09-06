import ServerDrivenSwiftUI
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    // register routes
    app.middleware.use(VersionValidationMiddleware())
    try routes(app)
}

struct VersionValidationMiddleware: AsyncMiddleware {
    func respond(to request: Request, chainingTo next: AsyncResponder) async throws -> Response {
        guard
            let version = request.parameters.get("version"),
            let requestNumberStr = version.components(separatedBy: ".").first,
            let requestNumber = Int(requestNumberStr),
            let packageVersionNumberStr = ServerDrivenSwiftUI.packageVersion.components(separatedBy: ".").first,
            let packageVersionNumber = Int(packageVersionNumberStr),
            requestNumber == packageVersionNumber
        else {
            print("This is bad because package number is not provided, \(request.parameters.get("version") ?? "") ")
            throw Abort(.gone)
        }

        let response = try await next.respond(to: request)
        response.headers.add(name: "PackageVersion", value: ServerDrivenSwiftUI.packageVersion)
        return response
    }
}
