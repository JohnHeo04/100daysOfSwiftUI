//
//  ContentView.swift
//  WeSplit
//  100daysOfSwiftUI
//  Day16 : Binding state to user interface controls
//
//  Created by 허정욱 on 15/04/2021.
//  Copyright © 2021 JohnHur. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var name = " "
    // Struct에서 Property인 name을 바꾸기 위해 @State가 쓰임.
    
    // 하지만 이번엔 @State만 쓴다고해서 작동하지 않음
    // 고로 밑 TextField 안에 있는 text: $(달러) '$달러' 표기를 써 줌.
    // $ <- 이 표시는 앞에서 뭔가 바뀐다면 앞의 속성 값을 다시 읽어야한다.
    var body: some View {
        Form {
            TextField("Enter your name is", text: $name)
            Text("Your name is \(name)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
