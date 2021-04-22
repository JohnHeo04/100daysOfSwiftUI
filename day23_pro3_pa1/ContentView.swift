//
//  ContentView.swift
//  day23_pro3_pa1
//  Day23: Views as properties

//  Created by Johnhur on 22/04/2021.
//  Copyright © 2021 JohnHur. All rights reserved.
//
// Walt Disney once said, "There isno magic in magic, it's all in the details."

// You just need to experiment.

import SwiftUI

struct ContentView: View {
    var motto1: some View { Text("Draco dormiens")}
    let motto2 = Text("nanquam titillandus")
    
    var body: some View {
        VStack {
            motto1
                .foregroundColor(.red)
            motto2
                .foregroundColor(.blue)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
