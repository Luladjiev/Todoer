//
//  ContentView.swift
//  Todoer
//
//  Created by Peter Luladjiev on 12.08.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ListScreen()
                .tabItem {
                    Label("Todo", systemImage: "list.bullet")
                }
            
            CompletedScreen()
                .tabItem {
                    Label("Completed", systemImage: "checkmark.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ListViewModel())
    }
}
