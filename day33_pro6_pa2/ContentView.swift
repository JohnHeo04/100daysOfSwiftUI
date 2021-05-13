//
//  ContentView.swift
//  day33_pro6_pa2
//  Day33 : Controlling the animation stack
//
//  Created by John Hur on 2021/05/13.
//
//  animation() modifier는 여러 개 쓸 수 도 있음

import SwiftUI

struct ContentView: View {
    // false라면 enabled ? 00 : 01 중 01을 먼저 call함
    @State private var enabled = false
    
    var body: some View {
        Button("Tap Me") {
            // toogle은 on/off - true/false를 통해 control
            self.enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? Color.blue : Color.red)
        .animation(nil)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 :  0))
        // 아래의 modifier를 통해 animate할때 자연스럽게 해줌
        .animation(.interpolatingSpring(stiffness: 10, damping: 1))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
