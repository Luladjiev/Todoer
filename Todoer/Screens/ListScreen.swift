//
//  ListScreen.swift
//  Todoer
//
//  Created by Peter Luladjiev on 12.08.23.
//

import SwiftUI

struct ListScreen: View {
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                if listViewModel.items.isEmpty {
                    NoItemsView()
                        .transition(AnyTransition.opacity.animation(.easeIn))
                } else {
                    List {
                        ForEach(listViewModel.items) { item in
                            ListRowView(item: item)
                                .onTapGesture {
                                    withAnimation(.linear) {
                                        listViewModel.updateItem(item: item)
                                    }
                                }
                        }
                        .onDelete(perform: listViewModel.deleteItem)
                        .onMove(perform: listViewModel.moveItem)
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationDestination(for: Routes.self) { route in
                switch route {
                case .Add:
                    AddScreen()
                }
            }
            .navigationTitle("Todoer")
            .toolbar() {
                if listViewModel.items.isEmpty == false {
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink("Add", value: Routes.Add)
                    }
                }
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListScreen()
            .environmentObject(ListViewModel())
    }
}
