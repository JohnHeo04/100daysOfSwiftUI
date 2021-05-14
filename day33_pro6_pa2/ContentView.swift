//
//  ContentView.swift
//  day33_pro6_pa2
//  Day33 : Animating gestures
//
//  Created by John Hur on 2021/05/13.
//
import SwiftUI

struct ContentView: View {
    let letters = Array("Hello SwiftUI")
    @State private var enabled = false
    // 손가락에 위치 정보를 저장하기 위한 변수
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<letters.count) { num in Text(String(self.letters[num]))
                .padding(5)
                .font(.title)
                .background(self.enabled ? Color.blue : Color.red)
                .offset(self.dragAmount)
                .animation(Animation.default.delay(Double(num) / 20))
            }
        }
        .gesture(
            DragGesture()
            // 아래의 두 closure를 실행하면 single parameter가 주어짐
            // 아래의 두 closure는 -어디서 시작하는지, 현재 어디인지, 얼마나 많이 움직였는지 묘사함
            // .onChanged는 사용자가 손가락을 움직일때 closure를 실행 시킴
                .onChanged { self.dragAmount = $0.translation}
            // .onEnded는 스크린에서 손가락을 들어올릴때 closure를 실행함
            // onEnded()는 전체 인풋값을 무시해버림, 왜냐하멘 dragAmount값이 'zero'로 세팅 되기 때문임
                .onEnded { _ in
                          self.dragAmount = .zero
                          self.enabled.toggle()
                }
            )
        }
    }

//
//        LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
//        .frame(width: 300, height: 200)
//        .clipShape(RoundedRectangle(cornerRadius: 10))
//        .offset(dragAmount)
//            .gesture(
//            DragGesture()
            // .onChanged는 사용자가 손가락을 움직일때 closure를 실행 시킴
//                .onChanged { self.dragAmount = $0.translation}
//                .onEnded { _ in
//                    withAnimation(.spring()) {
//                    self.dragAmount = .zero}
//                }
//            )
////            .animation.sprint())


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
