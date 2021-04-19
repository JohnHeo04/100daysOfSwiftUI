//
//  ContentView.swift
//  day21_pro2_pa2
//  Day21 : Stacking up buttons
//
//  Created by Johnhur on 19/04/2021.
//  Copyright © 2021 JohnHur. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    // 아래의 정수형태의 변수는 어떤 나라 이미지가 맞는지 확인함.
    // Int.random함수는 숫자를 자동으로 고른다.
    var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        //ZStack을 하나 더 만들어 흰색이 있는 국기를 구별시켜 줌.
        ZStack {
            Color.blue.edgesIgnoringSafeArea(.all)
            
            //간격을 30정도 주어 더 보기 좋게함.
            VStack(spacing: 30) {
                //아래의 VStack을 통해 텍스트를 수직형태로 정렬
                VStack {
                    Text("Tap the flag of")
                        //글자를 흰색으로 만드는 마법
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                }
                
                ForEach(0 ..< 3) { number in Button(action: {
                    // flag was tapped
                }) { Image(self.countries[number])
                        // 아래의 modifier(수식어)는 original 이미지를 그대로 렌더링 함
                        .renderingMode(.original)
                        }
                    }
                // *복습:아래의 함수는 화면 끝으로 밀어버림
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
