//
//  ContentView.swift
//  day32_pro6_pa1
//  Day32 : Animating bindings
//
//  Created by John Hur on 2021/05/11.
//

// animation() modifier는 swiftUI 현재 value와 new value 사이 어디든 결합 가능

import SwiftUI

struct ContentView: View {
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        print(animationAmount)
        // return을 사용하면 view가 어떤 부분을 돌려 받는지 알 수 있음
        return VStack {
            // Stepper로 animationAmount 값 +, -로 조절가능
            Stepper("Scale amount", value: $animationAmount.animation(
                        Animation.easeInOut(duration: 1)
                            .repeatCount(3, autoreverses: true)), in: 1...10)
            
            Spacer()
            
            Button("Tap Me") {
                self.animationAmount += 1
            }
            .padding(40)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
            
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
