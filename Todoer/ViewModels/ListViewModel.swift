//
//  ListViewModel.swift
//  Todoer
//
//  Created by Peter Luladjiev on 12.08.23.
//

import Foundation

class ListViewModel: ObservableObject {
    var allItems: [ItemModel] = [] {
        didSet {
            saveItems()
            items = allItems.filter({ $0.isCompleted == false})
            completedItems = allItems.filter({ $0.isCompleted })
        }
    }
    
    @Published var items: [ItemModel] = []
    @Published var completedItems: [ItemModel] = []
    
    let itemsKey = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let newItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.allItems = newItems
    }
    
    func addItem(title: String) {
        allItems.append(ItemModel(title: title, isCompleted: false))
    }
    
    func deleteItem(indexSet: IndexSet) {
        allItems.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        allItems.move(fromOffsets: from, toOffset: to)
    }
    
    func updateItem(item: ItemModel) {
        if let index = allItems.firstIndex(where: { $0.id == item.id }) {
            allItems[index] = item.updateCompletion()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(allItems) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
