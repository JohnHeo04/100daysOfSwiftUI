//
//  ContentView.swift
//  day21_pro2_pa2
//  Day21 : Styling our flags
//
//  Created by Johnhur on 20/04/2021.
//  Copyright © 2021 JohnHur. All rights reserved.
//
// SwiftUI는 수 많은 modifiers-수식어, 꾸며주는..-를 가지고 있다.
// 이런 modifiers들은 폰트들과 이미지들을 렌더링할 수 있도록 도움.
// 아래는 modifiers들을 흔히 쌓는 방식이다.

// 코드들을 자세히 보면 더미 형태로 구성되어있음
// 연습 할 때 대괄호-square brackets[], 중괄호-braces{}, 소괄호-brackets()
// 들이 어떤 더미 형태로 이루어져있나 체크하면 나중에 앱을 구성하는데 있어 많은 도움이 될 것

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()

    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    var body: some View {
        ZStack {
            // 더 나아 보이게 만들기 위해 파란 단일 배경에서 선형 그라데이션으로 변경함.
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                        .fontWeight(.medium)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        // 아래의 modifier는 폰트를 크고 black체로 해줌
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach(0 ..< 3) { number in Button(action: {
                    self.flagTapped(number)
                }) { Image(self.countries[number])
                        .renderingMode(.original)
                    .clipShape(Capsule())
                    .overlay(Capsule()
                        .stroke(Color.black, lineWidth:1))
                    .shadow(color: .black, radius: 2)
                        }
                    }
                Spacer()
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is ???"), dismissButton: .default(Text("Continue")) {
                    self.askQuestion()
                })
        }
    }
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }
        
        showingScore = true
    }
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
