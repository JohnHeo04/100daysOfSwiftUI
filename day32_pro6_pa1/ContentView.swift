//
//  ContentView.swift
//  day32_pro6_pa1
//  Day32 : Creating implicit animations
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
            self.animationAmount += 1
            
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        // 아래의 값 1.0은 100%랑 같음, 만약 CGFloat이 5면 500%로 5배 커진걸 볼 수 있음
        .scaleEffect(animationAmount)
        // animationAmount - 1 은 Blur효과를 0부터 시작하게 해줌
        // 다음 3포인트 6포인트 9포인트씩 증가함
        .blur(radius: (animationAmount - 1) * 3)
        .animation(.default)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
