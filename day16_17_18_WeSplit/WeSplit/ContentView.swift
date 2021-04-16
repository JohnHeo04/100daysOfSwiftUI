//
//  ContentView.swift
//  WeSplit
//  100daysOfSwiftUI
//  Day17 : Adding a segmented control for tip percentages
//
//  Created by Jeonguk Hur on 16/04/2021.
//  Copyright © 2021 JohnHur. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        // String을 Double로 형변환하는 법은 다음과 같다.
        // Double(문자열의 변수명)
        // Eg) let stringValue = "0.5"
        // ->  let doubleValue = Double(string(Value)
        
        // 위의 checkAmount에는 어떤 데이터 타입이 들어갈지 모른다.
        // 그러므로 이때는 optional을 이용해 안전하게 Double로 변환할 수 있게 된다.
        // 여기서는 가장 쉬운 방법으로 nil coalescing operator인 ??를 사용한다.
        let peopleCount = Double(numberOfPeople + 2)
        // peopleCount = 4.0
        let tipSelection = Double(tipPercentages[tipPercentage])
        // tipSelection = 20.0
        let orderAmount = Double(checkAmount) ?? 0
        // 만약 35 입력, orderAmount = 35.0
        // checkAmount는 Double로 형변환을 하게 된다.
        // 그러나 형변환이 실패하더라도 optional을 썼기 때문에 0으로 사용된다.
        
        let tipValue = orderAmount / 100 * tipSelection
        // 35.0 / 100 * 20.0
        // tipValue = 7.0
        let grandTotal = orderAmount + tipValue
        // 35.0 + 7.0
        // grandTotal = 42.0
        let amountPerPerson = grandTotal / peopleCount
        // 42.0 / 4.0
        // amountPerPerson = 10.0
        
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
                    // 여기 위의 "%.2f"는 C 언어이다.
                    // 의미 : a two-digit floating-point number
                    // %.(int)f 여기서 int는 소수 몇째 자리까지 나타낼지를 표기한다.
                    // 1 = 첫 째 자리, 2 = 둘 째 자리, 3 = 셋 째
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
