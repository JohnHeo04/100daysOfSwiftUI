//
//  ContentView.swift
//  WeSplit
//  100daysOfSwiftUI
//  Day17 : Creating pickers in a form
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
    
    var body: some View {
        // 아래의 NavigationView는 많은 프로그램들이 실행되고 있을 때 사용자가 어디있는지 보여주는 네비게이션의 역할을 하게 된다.
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

                Section {
                    Text("$\(checkAmount)")
                }
            }
            .navigationBarTitle("WeSplit")
            // '네비게이션뷰'에 제목을 생성함
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
