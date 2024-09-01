//
//  todoAppApp.swift
//  todoApp
//
//  Created by Ramandeep Singh on 31/08/24.
//

import SwiftUI
import SwiftData

@main
struct todoAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: TodoItem.self)
    }
}
