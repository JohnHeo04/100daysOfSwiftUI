//
//  ContentView.swift
//  day20_project2

//  Day20 : Showing alert messages
//
//  Created by  John Hur on 19/04/2021.
//  Copyright © 2021 JohnHur. All rights reserved.

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false

    var body: some View {
        Button("Show Alert") {
            self.showingAlert = true
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Hello SwiftUI!"), message: Text("This is some detail message"), dismissButton: .default(Text("Ok!")))
        }
    }
}
//
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
