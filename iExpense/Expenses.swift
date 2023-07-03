//
//  Expenses.swift
//  iExpense
//
//  Created by Boubacar sidiki barry on 21.06.23.
//

import Foundation

class Expenses : ObservableObject {
    @Published var item = [ExpenseItem](){
        didSet{
            if let data = try? JSONEncoder().encode(item){
                UserDefaults.standard.set(data, forKey: "itemData")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "itemData") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                item = decodedItems
                return
            }
        }

        item = []
    }
    
}
