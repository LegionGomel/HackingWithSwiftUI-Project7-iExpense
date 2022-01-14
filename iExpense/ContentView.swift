//
//  ContentView.swift
//  iExpense
//
//  Created by Yuri Ershov on 14.01.22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingSheet = false
    
    var body: some View {
        Button("Show Sheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SecondView(name: "Yuri")
        }
    }
}

struct SecondView: View {
    let name: String
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button("Dismiss") {
            dismiss()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
