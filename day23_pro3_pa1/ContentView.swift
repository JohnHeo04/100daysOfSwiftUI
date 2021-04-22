//
//  ContentView.swift
//  day23_pro3_pa1
//  Day23: Why modifier order matters

//  Created by Johnhur on 22/04/2021.
//  Copyright © 2021 JohnHur. All rights reserved.
//
// Walt Disney once said, "There isno magic in magic, it's all in the details."

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello World")
        .padding()
            .background(Color.red)
        .padding()
            .background(Color.blue)
        .padding()
            .background(Color.green)
        .padding()
            .background(Color.yellow)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
