# ServerDrivenSwiftUI

Maintain ios apps without making app releases.

Deploy changes to the server and users will receive changes within minutes.

This package describes how you can use server-driven UI together with SwiftUI.

Instead of writing SwiftUI code directly into your app, you can write it on the server side. The app fetches the content and displays it according to the server side implementation. Just like a web browser!

Example of a server side implementation:
``` Swift
Models.VStack(spacing: 20) {
    Models.Image(systemName: "globe")
        .foregroundColor(.blue)
        .frame(width: 100)

    Models.Text("It works!")

    Models.Button(action: .reload) {
        Models.HStack(spacing: 4) {
            Models.Image(systemName: "arrow.uturn.left.circle")
                .frame(width: 20)
            Models.Text("Reload")
        }
    }
}
```

## See example apps within this package
- iOS App: ServerDrivenSwiftUIExampleProject
- Vapor server - ServerExample
