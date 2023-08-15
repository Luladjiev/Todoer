//
//  CompletedScreen.swift
//  Todoer
//
//  Created by Peter Luladjiev on 12.08.23.
//

import SwiftUI

struct CompletedScreen: View {
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(listViewModel.completedItems) { item in
                    ListRowView(item: item, hideIcon: true)
                        .onTapGesture {
                            withAnimation(.linear) {
                                listViewModel.updateItem(item: item)
                            }
                        }
                }
                .onDelete(perform: listViewModel.deleteItem)
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Completed tasks")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
        }
       
    }
}

struct ArchiveScreen_Previews: PreviewProvider {
    static var previews: some View {
        CompletedScreen()
            .environmentObject(ListViewModel())
    }
}
