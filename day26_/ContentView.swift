//
//  ContentView.swift
//  day26 : Entering numbers with Stepper
//
//  Created by JohnHur on 2021/04/28.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    
    var body: some View {
        Stepper(value: $sleepAmount) {
                Text("\(sleepAmount) hours")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
