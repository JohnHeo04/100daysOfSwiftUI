//
//  ContentView.swift
//  day23_pro3_pa1
//  Day23: Environment modifiers

//  Created by Johnhur on 22/04/2021.
//  Copyright © 2021 JohnHur. All rights reserved.
//
// Walt Disney once said, "There isno magic in magic, it's all in the details."

// You just need to experiment.
// 하나의 modifier를 가지고 어디든 넣어봐라,
// crtl+c,+v 보다 훨 났다.. ㅎㅇㅌ

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            Text("Gryffindor")
            //    .font(.largeTitle)
                .blur(radius: 5)
            Text("Hufflepuff")
            Text("Ravenclaw")
                .blur(radius: 5)
                .font(.largeTitle)
            Text("Slytherin")
        }
//        .font(.title)
            .blur(radius: 0)
        // 위에 있는 modifier는 environment modifier로 불려진다.

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
