//
//  ContentView.swift
//  WeSplit
//
//  Created by 허정욱 on 15/04/2021.
//  Copyright © 2021 JohnHur. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // struct는 constant로 이루어져있어서 안의 var로 이루어진 변수를 변경할 수 없다.
    // 하지만 @State를 쓰게 되면 struct의 제한이 풀리게 되며,
    // swift에 의해 값을 별도로 저장할 수 있게 된다.
    
    // 그렇다면 왜 class를 쓰지 않고 struct를 쓸까? (답은 전 기초를 다질때 간다하게만 배웠다.
    // 이어지는 심화 내용은 뒤에서 차근차근 다룰 예정)
    
    // 각각 장단점이 있다. class는 자유롭다. struct는 안전하다.
    @State private var tapCount = 0
    
    var body: some View {
        Button("Tap Count: \(tapCount)") {
            self.tapCount += 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
