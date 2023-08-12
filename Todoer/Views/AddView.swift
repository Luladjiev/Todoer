//
//  AddView.swift
//  Todoer
//
//  Created by Peter Luladjiev on 12.08.23.
//

import SwiftUI

struct AddView: View {
    enum FocusField {
        case title
    }
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText = ""
    @State var showAlert = false
    @State var alertTitle = ""
    
    @FocusState private var focusedField: FocusField?
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type new todo item...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                    .focused($focusedField, equals: .title)
                
                Button(action: saveButtonPressed) {
                    Text("Save".uppercased())
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .alert(isPresented: $showAlert, content: getAlert)
            }
            .padding(14)
        }
        .navigationTitle("Add an Item")
        .onAppear {
            focusedField = .title
        }
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText.trimmingCharacters(in: .whitespacesAndNewlines))
            dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.trimmingCharacters(in: .whitespacesAndNewlines).count < 1 {
            alertTitle = "Todo item should not be empty"
            showAlert.toggle()
            return false
        }
        
        return true
    }
    
    func getAlert() -> Alert {
        Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}

