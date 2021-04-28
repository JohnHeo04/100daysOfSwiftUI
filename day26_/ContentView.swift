//
//  ContentView.swift
//  day26 : Training a model with Create ML(Machine Learning)
//
//  Created by JohnHur on 2021/04/28.
//
//  Paul Hudson님이 가지고 있는 CSV파일을 이용해 기계학습을 시킨다.
//  여기서 쓰이는 샘플 피쳐들은 이 프로젝트를 위해 쓰인다.

//  신기하게도 XCode는 앱 자체에서 'Xcode' -> 'open developer tool' -> 'Create ML'을 누르면 기계학습을 시키는 패키지가 내장되어있다..
//  이래서 용량이 큰거냐!

//  만약 사람들이 잠을 얼마나 자야하는지 알고 싶다면, 커피 몇잔을 마시는지 학습시켜 답을 예측할 수 있다.
//  'actualSleep'을 타겟변수로 놓고 다른 피쳐(wake, estimateSleep, and coffee)들을 선택 변수로 놓는다.
//  CSV파일을 업로드하고 아래 보면 여러 알고리즘이 있는데 지금 학습자는 자동선택으로 데이터를 학습시켰다.

//  재밌다.....

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date()
    
    var body: some View {
        DatePicker("Please enter a date", selection: $wakeUp, displayedComponents: .hourAndMinute)
                .labelsHidden()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
