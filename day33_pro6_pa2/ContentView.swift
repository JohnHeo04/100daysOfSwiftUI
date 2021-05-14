//
//  ContentView.swift
//  day33_pro6_pa2
//  Day33 : Building custom transitions using ViewModifier
//
//  Created by John Hur on 2021/05/13.
//
//  아래의 modifier중 .asymmetric은 유용한 modifier중 하나임
//  .asymmetric으로 다양한 재밌는 실험을 해볼 수 있음

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    // SwiftUI에선 anchor을 컨트롤 할 수 있는 데이터 타입 UnitPoint가 주어짐
    // 어느 기울기 부분이 제자리에 고정되어야 하는지
    // 기울기를 위해 X/Y 특정해 진다거나 많은 옵션을 제공함 -.topLeading, .bottomeTrailing, .center- 등
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content.rotationEffect (.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}

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
                    .transition(.pivot)
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
