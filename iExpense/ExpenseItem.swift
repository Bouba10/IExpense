//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Boubacar sidiki barry on 21.06.23.
//

import Foundation

struct ExpenseItem :Identifiable,Codable {
    var id = UUID()
    let name : String
    let type : String
    let amount :Double
}
