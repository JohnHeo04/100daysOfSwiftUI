//
//  ContentView.swift
//  day26 : Entering numbers with Stepper
//
//  Created by JohnHur on 2021/04/28.
//


import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    
    //  Stepper 메소드는 '+', '-'를 탭해서 정확한 숫자를 선택할 수 있게 해줌
    //  다른 옵션으로는 Slider가 있음, 요건 나중에 배우게 됨.
    
    //  Stepper는 in으로 값을 받아들일 수 있음
    var body: some View {
        Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                Text("\(sleepAmount, specifier: "%g") hours")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
