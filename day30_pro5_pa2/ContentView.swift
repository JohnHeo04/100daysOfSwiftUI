//
//  ContentView.swift
//  day30_pro5_pa2
//  Day30 : Adding to a list of words
//
//  Created by John Hur on 2021/05/06.
//

import SwiftUI

struct ContentView: View {
//  usedWords 문자 배열로 받기
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter your word", text: $newWord, onCommit: addNewWord)
                    //  UI를 조금 더 이쁘게 만들어줌.
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .padding()
                
                List(usedWords, id: \.self) {
                    Image(systemName: "\($0.count).circle")
                    Text($0)
                }
            }
            .navigationBarTitle(rootWord)
        }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased()
            .trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else {
            return
        }
        
        // extra validation to come
        // usedWords 배열에 0번부터 answer 단어 넣기
        usedWords.insert(answer, at: 0)
        newWord = ""
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
