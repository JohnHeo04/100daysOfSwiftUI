//
//  ContentView.swift
//  day29_pro5_wordScramble
//  Day29: Introducing List, your best friend

//  Created by John Hur on 2021/05/04.
//
//  *iOS 14부터 Section의 Header Text는 대문자로 출련된다.
//  하지만 공식 문서에 따르면 Section 마지막에 }.textCase(nil)을
//  쓰게 되면 original Text를 출력하게 됨.

//  List는 UIKit의 UITableView와 같음

//  List보다는 Form을 더 많이 쓰게 된다.
//  List는 특별한 타입에서 예외적으로 쓰인다.

//  이 프로젝트에서는 List를 써볼 예정
//  String타입의 배열을 만들어 본다.

import SwiftUI

struct ContentView: View {
    let people = ["Finn", "Leia", "Luke", "Rey"]
    
    var body: some View {
        List {
            ForEach(people, id: \.self) {
                Text($0)
            }
        }
        
//        .listStyle(GroupedListStyle())
        .listStyle(InsetGroupedListStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
