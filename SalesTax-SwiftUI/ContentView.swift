//
//  ContentView.swift
//  SalesTax-SwiftUI
//
//  Created by Isac Moura Gomes on 06/11/22.
//

import SwiftUI

struct ContentView: View {
    @State var beforeTaxPrice: String = ""
    @State var salesTaxRate: String = ""
    @State var afterTaxPrice: String = ""
    
    var body: some View {
        VStack {
            Text("Sales Tax Calculator")
                .font(.largeTitle)
                .foregroundColor(Color.blue)
                .padding()
            HStack {
                Text("Before Tax Price")
                TextField("$0", text: $beforeTaxPrice)
                    .keyboardType(/*@START_MENU_TOKEN@*/.decimalPad/*@END_MENU_TOKEN@*/)
            }
            .padding(.top, 40.0)
            
            HStack {
                Text("Sales Tax Rate")
                TextField("4.2%", text: $salesTaxRate)
                    .keyboardType(/*@START_MENU_TOKEN@*/.decimalPad/*@END_MENU_TOKEN@*/)
            }
            .padding(.top, 20.0)
            
            HStack {
                Text("After Tax Price")
                TextField("$0", text: $afterTaxPrice)
                    .disabled(true)
            }
            .padding(.top, 20.0)
            
            Button("Calculate", action: {
                if let beforeTax = Float(beforeTaxPrice),
                   let tax = Float(salesTaxRate) {
                    let salesTax = beforeTax * tax / 100
                    afterTaxPrice = String(beforeTax + salesTax)
                }
                   
            })
                .padding(.top, 40.0)
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
