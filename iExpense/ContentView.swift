//
//  ContentView.swift
//  iExpense
//
//  Created by Boubacar sidiki barry on 20.06.23.
//

import SwiftUI



struct ContentView: View {
   
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
   
    
    var body: some View {
        
        NavigationStack {
            List{
                
                ForEach(expenses.item){ item in
                    HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }

                            Spacer()
                            Text(item.amount, format: .currency(code: "USD"))
                        }
                    
                }
                .onDelete(perform: removeItem)
            }
            .navigationTitle("iExpense")
            
            .toolbar{
                Button {
                    
                    showingAddExpense.toggle()
                } label: {
                    Image(systemName: "plus")
                }.sheet(isPresented: $showingAddExpense){
                    AddView(expenses: expenses)
                }
               
            }
            
        }
    }
    func removeItem(at offset : IndexSet){
        expenses.item.remove(atOffsets: offset)
    }
    
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
