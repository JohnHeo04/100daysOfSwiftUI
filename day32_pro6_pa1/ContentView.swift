//
//  ContentView.swift
//  day32_pro6_pa1
//  Day32 : Customizing animations in SwiftUI
//
//  Created by John Hur on 2021/05/11.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        Button("Tap Me") {
            // 버튼을 'Tap'하게 되면 크기가 1씩 증가
            // 변수 값 animationAmount에 탭할때 마다 값 +1
//            self.animationAmount += 1
            
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        // 버튼 위에 빨간 원형 선을 만든다.
        // opacity 2-1 = 1로 설정
        // 두번째 animationAmount에 +=1 이 되면 0이되어 투명해짐
        .overlay(
            Circle()
                    .stroke(Color.red)
                    .scaleEffect(animationAmount)
                    .opacity(Double(2 - animationAmount))
                    .animation(
                        Animation.easeInOut(duration: 1)
                            .repeatForever(autoreverses: false)
            //                .repeatCount(3, autoreverses: true)
                )
            )
        .onAppear {
            self.animationAmount = 2
        }
//        .scaleEffect(animationAmount)
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
