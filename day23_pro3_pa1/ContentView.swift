//
//  ContentView.swift
//  day23_pro3_pa1
//  Day23: View composition

//  Created by Johnhur on 22/04/2021.
//  Copyright © 2021 JohnHur. All rights reserved.
//
// Walt Disney once said, "There isno magic in magic, it's all in the details."

// You just need to experiment.

import SwiftUI

struct CapsuleText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .clipShape(Capsule())
        
    }
}
struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            CapsuleText(text: "First")
                .foregroundColor(.white)
            CapsuleText(text: "Second")
                .foregroundColor(.yellow)
        
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
