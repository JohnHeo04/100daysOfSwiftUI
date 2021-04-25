//
//  ContentView.swift
//  day24_pro3_pa2
//  Day24 : Challgenge Day
//
//  Created by JohnHur on 23/04/2021.
//  Copyright © 2021 JohnHur. All rights reserved.
//
//  Challenge.2
//  Go back to project 1 "WeSplit" and use a conditional modifier to change the total amount text view to red if the user selects a 0% tip.
//  Total Amount에 조건문을 사용하여 사용자가 0% 팁을 선택한다면 텍스트를 빨간색으로 바꿔주기n


import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    @State private var totalAmount = 0
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {

        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0

        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
        
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                Section {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
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
