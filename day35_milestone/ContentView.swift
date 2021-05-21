//
//  ContentView.swift
//  day35_milestone
//  Day35: Milestone: Projects 4-6
//
//  Created by John Hur on 2021/05/20.
//
//  Milestone : Challenge
//  My Goal is to build an "edutainment" app for kids to help them practice multiplication tables - "What is 7 x 8?" and so on.

//  Breaking it down :
//  * The player needs to select which multiplication tables they want to practice. This could be pressing buttons, or it could be an "Up to..." stepper, going from 1 to 12.
//  * The player should be able to select how many questions they want to be asked: 5, 10, 20, or "ALL".
//  * You should randomly generate as many questions as they asked for, whitin the difficulty range they asked for. For the "all" case you should generate all possible combinations.

//  Breaking it down :
//  사용자가 원하는 곱셈 테이블을 골라서 연습한다. 버튼을 누르거나 Stpper 버튼을 1~12까지 누를 수 있도록 한다.
//  사용자는 질문 수 5,10,20 또는 "모두"를 선택할 수 있다.
//  요청한 난이도 범위 내에서 질문한 만큼의 질문지들을 랜덤으로 출력. "all" 케이스의 경우 가능한한 모든 조합들을 보여준다.

//  9세 이하 아이들이 사용할 것이기에 밝게, 화려하고 조금은 엉뚱하게(zany) 만들어도 됨!

//  이 문제를 해결하기 위해 지금까지 배운것들을 모조리 활용해야 함
//  부담 가지지 말고 서서히 진행하기

//  1. 세팅화면, 설정을 진행하기
//  그  다음, 게임 실행
//  2. Top-level view에 Group을 사용하기
//  3. 모든 뷰를 하나의 ContentView에 다 넣기 보단 View를 나누어서 보여주기
//  4. 게임이 끝나면 사용자가 얼마나 많은 질문을 맞췄는지 보여주기, 그 다음 밑에 '게임 다시하기'를 보여주기 - 초기화

import SwiftUI

struct ContentView: View {
    // 여기 필요한 기본 변수명 추가 하는 곳
    
    var body: some View {
        // 이곳이 View추가, H,V,Z -Stack
        VStack {
            print("Hello World")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
