//
//  ContentView.swift
//  WeSplit
//
//  Created by Salim Hafid on 5/25/20.
//  Copyright © 2020 Salim Hafid. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var peopleEntry = ""
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var grandTotal: Double {
        
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        
        
        return grandTotal
    }
    
    var amountPerPerson: Double {
        var peopleCount = 1.0
        peopleCount = Double(peopleEntry) ?? 1
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                }
                Section {
                    
                    TextField("Number of people", text: $peopleEntry)
                        .keyboardType(.decimalPad)
                }
            
                    
                    
            
                
                Section(header: Text("How much tip do you want to leave?"))
                {
                    
                    Picker("Tip percentage", selection: $tipPercentage)
                    {
                        ForEach(0..<tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
            
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
               
                
                Section (header: Text("Amount per person"))
                {
                    Text("$\(amountPerPerson, specifier: "%.2f")")
                }
            
            Section (header: Text("Check Total"))
            {
                Text("$\(grandTotal, specifier: "%.2f")")
                    .foregroundColor(tipPercentages[tipPercentage] == 0 ? .red : .black)
            }
            
            
            }
            .navigationBarTitle("WeSplit")
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
