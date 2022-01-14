//
//  ContentView.swift
//  iExpense
//
//  Created by Yuri Ershov on 14.01.22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var expenses = Expenses()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items, id: \.name) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    let expense = ExpenseItem(name: "Test", type: "Personal", amount: 5)
                    expenses.items.append(expense)
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}

struct ExpenseItem {
    let name: String
    let type: String
    let amount: Double
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
