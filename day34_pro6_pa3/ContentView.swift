//
//  ContentView.swift
//  day34_pro6_pa3
//  Day34 : Challenge
//  1. When you tap the correct flag, make it spin around 360 degrees on the Y axis.
//  2. Make the other two buttons fade out to 25% opacity.
//  3. And if you tap on the wrong flag? Well, that's down to you - get createive!
//
//  Created by John Hur on 2021/05/14.
//

import SwiftUI

struct ContentView: View {
    @State private var degrees = 0.0
    @State private var isRotated = false
    // 사용자 점수 변수 설정
    @State private var userScore = 0
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()

    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State private var spinAnimationAmounts = [0.0, 0.0, 0.0]
    @State private var animatingIncreaseScore = false
    
    @State private var allowSubmitAnswer = true
    
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
                // 0,1,2
                // 여기가 아닌가
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
//        .alert(isPresented: $showingScore) {
//            Alert(title: Text(scoreTitle), message: Text("Your score is \(userScore)"), dismissButton: .default(Text("Continue")) {
//                    self.askQuestion()
//                })
//        }
    }
    // 아래 else 구문에 나오는 \(countries[number])을 써줌으로써
    // 틀린 국기의 이름을 보여줌.
    func flagTapped(_ number: Int) {
        guard allowSubmitAnswer else { return }
        allowSubmitAnswer = false
        
        let nextQuestionDelay = 1.5
        let flagAnimationDuration = 0.5
        let scoreUpdateDuration = 1.5
        
        if number == correctAnswer {
            scoreTitle = "Correct"
            userScore += 1
            
            withAnimation(Animation.easeInOut(duration: flagAnimationDuration)) {
                self.spinAnimationAmounts[number] += 360
            }
            withAnimation(Animation.linear(duration: scoreUpdateDuration)) {
                self.animatingIncreaseScore = true
            }
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number])"
            userScore -= 1
            
//            withAnimation(Animation.easeInOut(duration: flagAnimationDuration)) {
//                self.shakeAnimationAmounts[number] = 2
//            }
//            withAnimation(Animation.linear(duration: scoreUpdateDuration)) {
//                self.animatingDecreaseScore = true
//            }
        }
        showingScore = true
    }
    
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        allowSubmitAnswer = true
    }
    // if correct +=1, wrong +=0 or -=1
    // 스코어 함수 생성
    // 생략... 아래의 함수를 통해 점수가 올라가고 내려가는 함수를 만들려 했으나
    // flagTapped의 함수 중
    // 아래 userScore += 1 이라는 방법을 써서 간단하게 해결할 수 있었음
//    func scores() {
//        if scoreTitle
//        userScore
//
//    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
