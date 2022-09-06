//
//  ServerDrivenSwiftUIExampleProjectApp.swift
//  ServerDrivenSwiftUIExampleProject
//
//  Created by Andreas Linde on 2022-09-03.
//

import SwiftUI

@main
struct ServerDrivenSwiftUIExampleProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ContentViewModel())
        }
    }
}
