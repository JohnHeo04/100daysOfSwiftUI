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
    // VStack은 수직 정렬
    // VStack은 아래의 Text를 수직으로 출력해 줌. 하지만 여백 x
    // 이 때, VStack(spacing:20) 를 붙이면 여백이 생김
    // VStack(alignment: .leading)을 사용하게 되면 왼쪽 정렬 가능
        
    // HStack은 수평 정렬
        
    // Spacer()를 쓰게되면, 남아있는 공간으로 밀어버림
        VStack(spacing: 20) {
            Text("Frist")
            Text("Third")
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
