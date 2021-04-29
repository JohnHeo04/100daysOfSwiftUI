//
//  ContentView.swift
//  day27_pro4_pa2
//  day27 : Building a basic layout
//
//  Created by John Hur on 2021/04/29.
//
//  OVERVIEW
//  이 앱은 date picker와 두 가지의 steppers를 결합해 사용자가 언제 일어나길 원하는지 계산해주는 앱이다. 사용자가 얼마나 잠을 자야하는지, 커피를 얼마나 마셔야하는지 알려준다.


import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date()
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    
    var body: some View {
        NavigationView {
            VStack {
                Text("When do you want to wake up?")
                    .font(.headline)
                
                DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                
                Text("Desired amount of sleep")
                    .font(.headline)
                
                Stepper(value: $sleepAmount, in: 4...12, step: 0.25) { Text("\(sleepAmount, specifier: "%g") hours")
                }
                
                Text("Daily coffee intake")
                    .font(.headline)
                
                Stepper(value: $coffeeAmount, in: 1...20) {
                    if coffeeAmount == 1 {
                    Text("1 cup")
                } else {
                    Text("\(coffeeAmount) cups")
                    }
                }
            }
            .navigationBarTitle("BetterRest")
            // 오른쪽 상단 위에 trailing을 통해 'Calculate'라는 텍스트를 놓을 수 있다.
            // 만약 여러 버튼을 놓고 싶다면 HStack을 써서 가능
            // *action: calculateBedtimes를 통해 함수를 불러와 계산을 하게 됨.
            .navigationBarItems(trailing:
                                    Button(action: calculateBedtimes) {
                                        Text("Calculate")
                                    }
            )
        }
    }
        //  나중에 하게되는 몇시에 자러가야하는지 알려주는 함수
        func calculateBedtimes() {
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
