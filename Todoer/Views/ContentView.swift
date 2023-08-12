//
//  ContentView.swift
//  Todoer
//
//  Created by Peter Luladjiev on 12.08.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ListView()
                .navigationDestination(for: Routes.self) { route in
                    switch route {
                    case .Add:
                        AddView()
                    }
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
