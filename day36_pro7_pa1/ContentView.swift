//
//  ContentView.swift
//  day36_pro7_pa1
//
//  Created by John Hur on 2021/06/03.
//

import SwiftUI


// 아래의 struct를 class로 바꾸게 되면 TextField 안에 있는 변수들은 작동 X
// 만약 SwiftUI 개발자들이 하나의 같은 데이터로 2개 또는 더 많은 View에서 사용하고 싶다면 struct 보다는 class를 써야 한다.
class User {
    var firstName = "Bilbo"
    var lastName = "Baggins"
}

struct ContentView: View {
    @State private var user = User()
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName).")
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
