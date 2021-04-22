//
//  ContentView.swift
//  day23_pro3_pa1
//  Day23: Custom modifiers

//  Created by Johnhur on 22/04/2021.
//  Copyright © 2021 JohnHur. All rights reserved.
//
// Walt Disney once said, "There isno magic in magic, it's all in the details."

// You just need to experiment.

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}

struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        self.modifier(Watermark(text: text))
    }
}



struct ContentView: View {
    var body: some View {
        Color.blue
            .frame(width: 300, height: 300)
            .watermarked(with: "Hacking with Swift")
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
