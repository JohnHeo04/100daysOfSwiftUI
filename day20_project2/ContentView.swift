//
//  ContentView.swift
//  day20_project2

//  Day20 : Colors and frames
//
//  Created by  John Hur on 17/04/2021.
//  Copyright © 2021 JohnHur. All rights reserved.

//  Apple은 기본적으로 상단 바와 하단 바에 '안전 지역'을 설정해 놓음.
//  하지만, edgesIgnoringSafeArea(.all)을 통해 색을 꽉 채울 수 있음

import SwiftUI

struct ContentView: View {
    var body: some View {
        // 텍스트에 색 배경을 넣게 됨 .backround(Color.red)
        
        // 원하는 만큼 색 채우기
        // Color.red.frame(width: 200, height: 200)
        ZStack {
            Color.yellow.edgesIgnoringSafeArea(.all)
            Text("Your content")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
