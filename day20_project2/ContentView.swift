//
//  ContentView.swift
//  day20_project2

//  Day20 : Gradients
//
//  Created by  John Hur on 17/04/2021.
//  Copyright © 2021 JohnHur. All rights reserved.

import SwiftUI

struct ContentView: View {
    var body: some View {
        // 선형 그라데이션
//        LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
        // 원형 그라데이션
//        RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)
        // Angular 그라데이션
        AngularGradient(gradient: Gradient(colors: [.red,.yellow,.green,.blue,.purple,.red]), center: .center)
    }
}
//
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
