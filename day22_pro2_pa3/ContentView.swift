//
//  ContentView.swift
//  day22_pro2_pa3
//  Day22 : Challenge Day
//
//  Created by JohnHur on 20/04/2021.
//  Copyright © 2021 JohnHur. All rights reserved.
//
//  Today's Challenge
// 1.Add an @State property to store the user's score, modify it when they get an answer right or wrong, then display it in the alert
// 2.Show the player's current score in a label directly below the flags.
// 3.When someone chooses the wrong flag, tell them their mistake in your alert message - something like "Wrong! That's the flag of France," for example.

// 1.사용자 점수 property 추가, 답이 틀리든 맞든 그에 맞는 알람을 설정하기
// 2.사용자의 현재 점수를 국기 아래에 보여주어라
// 3.누군가 잘못된 답을 선택하면, 그들에게 실수 메세지를 알려줘라 - 예를 들면 "Wrong! That's the flag of France,"

import SwiftUI

struct ContentView: View {
    // 사용자 점수 변수 설정
    @State private var userScore = 0
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()

    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
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
                // 아래의 VStack을 써서 국기 밑에 Score점수가 뜨게함
                VStack {
                   Text("SCORE 👉 \(userScore)")
                   .foregroundColor(.white)
                   .font(.largeTitle)
               }
               Spacer()

            }
        }
        // 아래의 userScore를 넣어 알림창에서 마지막 몇점에서 끝났는지 알려줌
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is \(userScore)"), dismissButton: .default(Text("Continue")) {
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
