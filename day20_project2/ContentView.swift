//
//  ContentView.swift
//  day20_project2
//
//  Created by  John Hur on 17/04/2021.
//  Copyright © 2021 JohnHur. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
    // VStack은 아래의 Text를 수직으로 출력해 줌. 하지만 여백 x
    // 이 때, VStack(spacing:20) 를 붙이면 여백이 생김
        VStack(spacing: 20) {
            Text("Hello, World!")
            Text("This is another text view")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
