//
//  ContentView.swift
//  WeSplit
//  100daysOfSwiftUI
//  Day16 : Creating views in a loop
//
//  Created by 허정욱 on 15/04/2021.
//  Copyright © 2021 JohnHur. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let students = ["Harry", "Hermione", "Ron", "John", "Luke", "Peter", "Ram", "Zil", "Biden"]
    // studnets는 @State 쓸 필요 없음. let인 'constant'라서 때문이다.
    @State private var selectedStudent = "Ram"
    
    // ForEach는 SwiftUI의 Picker View와 함께 쓸 때 유용하다.
    
    var body: some View {
        Picker("Select your student", selection: $selectedStudent) {
            ForEach(0 ..< students.count) {
                Text(self.students[$0])
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
