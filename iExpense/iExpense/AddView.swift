//
//  AddView.swift
//  iExpense
//
//  Created by Yihwan Kim on 11/20/19.
//  Copyright © 2019 Yihwan Kim. All rights reserved.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var expenses: Expenses
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    @State private var isAlertShown = false
    
    static let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(Self.types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
            }
            .navigationBarTitle("Add new expense")
            .navigationBarItems(trailing: Button("Save") {
                if let actualAmount = Int(self.amount) {
                    let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount)
                    self.expenses.items.append(item)
                    
                    self.presentationMode.wrappedValue.dismiss()
                } else {
                    self.isAlertShown = true
                }
            })
                .alert(isPresented: $isAlertShown) {
                    Alert(title: Text("Invalid input"), message: Text("Only enter positive integers"), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    func validateInput() {
        
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
