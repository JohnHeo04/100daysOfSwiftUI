//
//  ContentView.swift
//  day26 : Selecting dates and times with DatePicer
//
//  Created by JohnHur on 2021/04/28.
//
//  같은 DatePicker 메소드임에도 2019년, 2021년의 SwiftUI가 다르다.
//  업데이트 했나보다...



import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date()
    
    var body: some View {
//        let now = Date()
//        let tomorrow = Date().addingTimeInterval(86400)
//        let range = now ... tomorrow
        
//      $wakeUp, ~ 다음
//      displayedComponents: .date는 월,날짜 그리고 년도를 표기
//      .hourAndMinute에는 사용자에게 시간과 분을 보여준다.
        DatePicker("", selection: $wakeUp, in: Date()...)
                .labelsHidden()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
