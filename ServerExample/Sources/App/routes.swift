import ServerDrivenSwiftUI
import Vapor

func routes(_ app: Application) throws {
    app.get(":version", "helloworld") { req async throws -> Response in

        let content = Models.VStack(spacing: 20) {
            Models.Image(systemName: "globe")
                .foregroundColor(.blue)
                .frame(width: 100)
                .onTapGesture(
                    .alert(
                        shouldBePresented: true,
                        withMessage: "You tapped on the image"
                    )
                )

            Models.Text("It works!")
            Models.Text("Now, try add models to the view")
                .font(.footnote, color: .gray)
            Models.Button(action: .reload) {
                Models.HStack(spacing: 4) {
                    Models.Image(systemName: "arrow.uturn.left.circle")
                        .frame(width: 20)
                    Models.Text("Reload")
                }
            }
        }.render()

        return encodedReponse(of: [content])
    }
}

func encodedReponse<Content: Codable>(of content: Content) -> Response {
    let encoder = JSONEncoder()
    var data: Data?
    do {
        data = try encoder.encode(content)
    } catch let e {
        print("❌", e)
    }

    guard let data = data else {
        return Response(status: .internalServerError, headers: ["Content-Type": "application/json"])
    }

    return Response(
        status: .ok,
        headers: ["Content-Type": "application/json"],
        body: Response.Body(data: data)
    )
}
