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
    
    var body: some View {
        // 아래의 NavigationView는 많은 프로그램들이 실행되고 있을 때 사용자가 어디있는지 보여주는 네비게이션의 역할을 하게 된다.
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                // 여기서는 아래 팁 박스에 있는 pickerStyle(SegmentedPickerStyle())이 적합하지 않다.
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }
                // 바로 밑 Section 다음 (header~ 는 화면상 tipPercentages박스 위에 나오는 제목을 회색 바탕에 위치 시킨다.
                
                // 밑에 .pickerStyle(SegmentedPickerStyle())은 박스로 tipPercentages가 5개 생성되어 선택할 수 있게 된다.
                // 실험: 위의 numberOfPeople에서도 적용하려 해봤지만 정수가 2부터 100까지 있어 적용은 되지만, 굉장히 적합하지 않은 상태의
                //      UI가 생성된다.
                // header 대신 footer를 사용하게 되면 "How muc~" 텍스트가 팁 박스 밑에 생성된다.
                Section(footer: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
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
