//
//  Bookworm_Project11App.swift
//  Bookworm_Project11
//
//  Created by Jesse Sheehan on 9/5/24.
//

import SwiftData
import SwiftUI

@main // tells swift: this is what launches the application
struct Bookworm_Project11App: App {
    var body: some Scene {
        WindowGroup { // this tells swiftUI our app can be displayed on multiple windows (like in ipad or mac)
            ContentView()
        }
        .modelContainer(for: Book.self)  //modifier that says to make/load storage for the Student.self info
        
        
    }
}
