//
//  TodoerApp.swift
//  Todoer
//
//  Created by Peter Luladjiev on 11.08.23.
//

import SwiftUI

@main
struct TodoerApp: App {
    @StateObject var listViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(listViewModel)
        }
    }
}
