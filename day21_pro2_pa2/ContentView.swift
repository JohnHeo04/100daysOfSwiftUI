//
//  ContentView.swift
//  day21_pro2_pa2
//  Day21 : Showing the player's score with an alert
//
//  Created by Johnhur on 20/04/2021.
//  Copyright © 2021 JohnHur. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // .shuffled() 메소드는 자동으로 배열의 순서를 바꾼다.
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()

    @State private var correctAnswer = Int.random(in: 0...2)
    
    // 아래의 변수는 알림 창에서 보이게 된다.
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    var body: some View {
        ZStack {
            Color.blue.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                }
                
                ForEach(0 ..< 3) { number in Button(action: {
                    self.flagTapped(number)
                }) { Image(self.countries[number])
                        .renderingMode(.original)
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
    // 어떤 국기를 택하건 간에 알림창으로 뜨게 됨
    // var body:... 다음 나옴
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }
        
        showingScore = true
    }
    // askQuestoin() 메소드는 국기를 섞고 새로운 답을 고르도록 리셋시킴
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
