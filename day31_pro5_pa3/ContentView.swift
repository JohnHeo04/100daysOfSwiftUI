//
//  ContentView.swift
//  day31_pro5_pa3
//  Challenge
//  1. Disallow answers that are shorter than three letters or are just our start word. For the three-letter check, the easiest thing to do is put a check into isReal() that returns false if the word length is under three letters. For the second part, just compare the start word against their input word and return false if they are the same.
//  2. Add a left bar button item that calls startGame(), so users can restart with a new word whenever they want to.
//  3. Put a text view below the List so you can track and show the player’s score for a given root word. How you calculate score is down to you, but something involving number of words and their letter count would be reasonable.
//
//  Created by John Hur on 2021/05/08.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    // -Error alerts-
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter your word", text: $newWord, onCommit: addNewWord)
                    //  TextField가 이뻐보이지 않기에 아래의 modifier를 써서 모서리를 둥글게 해줌
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .padding()
                
                List(usedWords, id: \.self) {
                    Image(systemName: "\($0.count).circle")
                    Text($0)
                }
            }
            .navigationBarTitle(rootWord)
            .onAppear(perform: startGame)
            .alert(isPresented: $showingError) {
                Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased()
            .trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else {
            return
        }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not possiblbe", message: "That isn't a real word")
            return
        }
        //  만약 우리가 append(answer을 쓰게되면 목록의 제일 끝에 나타나게 된다. 또한 스크린 밖으로 나갈 수 도 있다.
        //  그러나 inserting을 사용하게 되면 list의 제일 위에서 자동으로 시작하게 된다.
        usedWords.insert(answer, at: 0)
        newWord = ""
    }
    
    func startGame() {
        // 1. Find the URL for 'start.txt' in our app bundle
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            // 2. Load 'start.txt' into a string
            if let startWords = try? String(contentsOf: startWordsURL) {
                // 3. Split the string up into an array of strings, splitting on line breaks
                let allWords = startWords.components(separatedBy: "\n")
                // 4. Pick one random word, or use "silkworm" as a sensible default
                rootWord = allWords.randomElement() ?? "silkworm"
                // 5. If we are here everything has worked, so we can exit
                return
            }
        }
        // If were are *here* then there was a problem - trigger a crash and report the error
        // 오류가 발생하던 안하던 fatalError()이라는 function은 발견된 문제를 우리한테 깔끔하게 알려준다.
        // fatalError()을 호출하게 되면 우리의 앱은 충돌하게 된다. 즉 다운된다는 말씀.
        fatalError("Could not load start.txt from bundle.")
    }
    
    // 첫번째 메소드
    // "String"형태로 parameter를 받아들임,
    //  다음 'true' or 'false로 반환, 이전에 단어가 쓰였는지 안 쓰였는지
    // usedWords에 담겨있던 배열을 contains()메소드 결과로 다시 보내줌
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    //  다음은 조금 속임수를 씀 :
    //  어떻게 다른 랜덤 단어로부터 만들어진 다른 랜덤단어를 확인할 수 있을까
    //  가장 쉬운법 : 만약 우리가 뿌리 단어로부터 변수를 복사할 수 있다면, 우리는 우리의 카피 문자가 안에 존재하는지 보기 위해 사용자의 입력 단어를 각 문자로 반복 실행한다.
    //  만약 안에 단어가 존재한다면 복사본을 지운다, 그리고 계속된다.
    //  우리가 성공적으로 단어를 만들 수 있다면 단어는 good, 반면에 그렇게 된다면 이건 실수이며 우리는 false를 반환하게 된다.
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord.lowercased()
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        
        return true
    }
    
    //  마지막 메소드는 꽤 어려움, 왜냐하면 UIKit의 UITextChecker를 사용할 예정이기에...
    //  Swift와 Objective-C 'string'을 안정적으로 연결하기 위해,
    //  UTF-16 사용을 위해 NSRange의 instance를 만들 필요가 있다.
    
    //  UITextChecker는 단어의 스펠링을 채크하기 위해 쓰여진다.
    //  NSRange를 이용해 우리의 string 길이를 스캔한다.
    //  그런 다음 rangeOfMisspelledWord()를 호출해 단어에 잘못된게 있는지 체크한다.
    //  만약 위의 메소드 체크가 끝나면 한 번 더 또 다른 NSRange를 반환시킨다.
    //  그러나 만약 단어가 'OK'라면 NSNotFound로 범위가 위치하게 된다.
    
    //  전엥 지금까지 3개의 메소드가 쓰이기 위해 위쪽으로 넘어가 변수를 추가해준다.
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
    }
    
    //  parameters에 기반하여 title과 message를 set한다.
    //  다음 showingError을 true로 바꾼다.
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
