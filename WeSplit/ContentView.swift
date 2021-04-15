//
//  ContentView.swift
//  WeSplit
//  100daysOfSwiftUI
//  Day17 : Reading text from the user with TextField
//
//  Created by Jeonguk Hur on 15/04/2021.
//  Copyright © 2021 JohnHur. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        Form {
            Section {
                TextField("Amount", text: $checkAmount)
                    .keyboardType(.decimalPad)
            }
    // 기존의 스맛폰 키보드는 qwerty식으로 TextField를 채우게 됨
    // 하지만, .keyboardType 메소드? 함수? 를 쓰게 되면
    // qwerty식에서 -> 0부터 9로 탭하는 다른 키패드가 생기게 됨.
            Section {
                Text("$\(checkAmount)")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
