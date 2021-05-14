//
//  ContentView.swift
//  day33_pro6_pa2
//  Day33 : Showing and hiding views with transitions
//
//  Created by John Hur on 2021/05/13.
//
//  아래의 modifier중 .asymmetric은 유용한 modifier중 하나임
//  .asymmetric으로 다양한 재밌는 실험을 해볼 수 있음

import SwiftUI

struct ContentView: View {
    @State private var isShowingRed = false

    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation {
                    self.isShowingRed.toggle()
                }
            }
            
            if isShowingRed {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
//                    .transition(.scale)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
