//
//  ContentView.swift
//  day23_pro3_pa1
//  Day23: Conditional modifiers

//  Created by Johnhur on 22/04/2021.
//  Copyright © 2021 JohnHur. All rights reserved.
//
// Walt Disney once said, "There isno magic in magic, it's all in the details."

import SwiftUI

struct ContentView: View {
    @State private var useRedText = false
    
    var body: some View {
        // 만약 Hello World를 눌렀을때 True면 빨간색 출력, False 파랑 출력

//        Button("Hello World") {
//            self.useRedText.toggle()
//        }
//        .foregroundColor(useRedText ? .red : .blue)
        // 아래는 다른 View를 반환하기에 조건이 성립되지 않아 실행 X
        if self.useRedText {
            return Text("Hello World")
        } else {
            return Text("Hello World")
                .background(Color.red)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
