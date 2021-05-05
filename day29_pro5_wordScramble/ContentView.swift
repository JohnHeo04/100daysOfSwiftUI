//
//  ContentView.swift
//  day29_pro5_wordScramble
//  Day29: Loading resources from your app bundle

//  Created by John Hur on 2021/05/04.
//
//  URL이 웹주소 저장하는것보다 조금 더 강력하다.
//  URL은 파일의 위치까지 저장할 수 있다.

//

import SwiftUI

struct ContentView: View {
    var body: some View {
        if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
            // we found the file in our bundle
            if let fileContents = try? String(contentsOf: fileURL) {
                // we loaded the file into a string
            }
        }
        
       return Text("Hello World!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
