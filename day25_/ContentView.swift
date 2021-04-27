//
//  ContentView.swift
//  day25_
//  Day25: Challenge - Make a game R.P.S.(Rock Paper Scissors)
//  Da
//  Created by JohnHur on 2021/04/27.
//
//  Very roughly:
//  Each turn of the game the app will randomly pick either rock, paper, or scissors.
//  Each turn the app will either prompt the player to win or lose.
//  The player must then tap the correct move to win or lose the game.
//  If they are correct they score a point; otherwise they lose a point.
//  The game ends after 10 questions, at which point their score is shown.

//  It's a bitb similar when I made guess the Flag.
//  If you wanna know about what I made that was day22

import SwiftUI

struct ContentView: View {
    // rps = Rock, Paper, or Scissors
    //
    @State private var userScore = 0
    
    @State private var rps = ["rock", "paper", "scissors"].shuffled()
    

    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    var body: some View {
        ZStack {
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the Rock, Paper, or Scissors")
                    Image(rps[correctAnswer])
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 32.0, height: 32.0)
                }
            
                HStack {
                    ForEach(0 ..< 3) { number in Button(action: {
                        self.rpsTapped(number)
                    }) { Image(self.rps[number])
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100.0, height: 100.0)
                        }
                    }
                }
                Spacer()
                
                VStack {
                    Text("Score \(userScore)")
                }
                Spacer()
        }
    }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is \(userScore)"), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
            })
        }
}
    // 함수 들어가는 곳
    // 지는 경우를 설정하지 못함
    // 나중에 문제 다시 풀어보기
    func rpsTapped(_ number: Int) {
        if number != correctAnswer {
            scoreTitle = "Win!"
            userScore += 1
        }  else {
            scoreTitle = "Lose"
            userScore += 0
        }
        showingScore = true
    
}
    func askQuestion() {
        rps.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
