//
//  ContentView.swift
//  day29_pro5_wordScramble
//  Day29: Working with strings

//  Created by John Hur on 2021/05/04.
//
//  iOS는 문자열을 다룰 수 있는 강력한 API를 제공함
//  문자열을 배열로 분리하기도하고, 공백을 제거하고, 스펠링을 체크하기도 함

//  components(separatedBy: )는 싱글 문자열로 분해 해줌
//  "a b c" --> ["a", "b", "c"]

//  trimmingCharacters(in:)는 모든 기능을 하나의 메소드에서 제공함
//  공간, 텝, 라인 바꾸기 등


import SwiftUI

struct ContentView: View {
    var body: some View {
        let word = "swift"
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        let allGood = misspelledRange.location == NSNotFound
        
        
//        let input = """
//            a
//            b
//            c
//            """
//        let letters = input.components(separatedBy: "\n")
//        let letter = letters.randomElement()
//        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
        
//        let input = "a b c"
//        let letters = input.components(separatedBy: "")
        
       return Text("Hello World!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
