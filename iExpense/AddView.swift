//
//  AddView.swift
//  iExpense
//
//  Created by Boubacar sidiki barry on 21.06.23.
//

import SwiftUI

struct AddView: View {
        @State private var name = ""
        @State private var type = "Personal"
        @State private var amount = 0.0

        let types = ["Business", "Personal"]
    
        @ObservedObject var expenses: Expenses
        @Environment(\.dismiss) var dismiss

        var body: some View {
            NavigationStack {
                Form {
                    TextField("Name", text: $name)

                    Picker("Type", selection: $type) {
                        ForEach(types, id: \.self) {
                            Text($0)
                        }
                    }

                    TextField("Amount", value: $amount, format: .currency(code: "USD"))
                        .keyboardType(.decimalPad)
                }
                .navigationTitle("Add new expense")
                .toolbar {
                    Button("Save") {
                        let item = ExpenseItem(name: name, type: type, amount: amount)
                        expenses.item.append(item)
                        
                        dismiss()
                    }
                }
            }
        }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
