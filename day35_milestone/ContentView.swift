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
