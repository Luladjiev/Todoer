//
//  ListRowView.swift
//  Todoer
//
//  Created by Peter Luladjiev on 12.08.23.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    var hideIcon = false
    
    var body: some View {
        HStack {
            if !hideIcon {
                Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                    .foregroundColor(item.isCompleted ? .green : .red)
            }
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var item1 = ItemModel(title: "Todo one", isCompleted: false)
    static var item2 = ItemModel(title: "Todo two", isCompleted: true)
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2, hideIcon: true)
        }
        .previewLayout(.sizeThatFits)
    }
}
