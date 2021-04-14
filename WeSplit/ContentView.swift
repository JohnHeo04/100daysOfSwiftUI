//
//  ContentView.swift
//  WeSplit
//
//  Created by 허정욱 on 15/04/2021.
//  Copyright © 2021 JohnHur. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            Form {
                Section {
                    Text("Hello, World!")
                }
            }
            .navigationBarTitle(Text("SwiftUI"), displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
