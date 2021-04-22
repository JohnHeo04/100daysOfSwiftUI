//
//  ContentView.swift
//  day23_pro3_pa1
//  Day23: Custom containers

//  Created by Johnhur on 22/04/2021.
//  Copyright © 2021 JohnHur. All rights reserved.
//
// Walt Disney once said, "There isno magic in magic, it's all in the details."

// You just need to experiment.
// 배열을 스택형식으로 쌓게 된다.
// 사실 오늘 내용은 조금 어렵다 생각하므로 나중에 다시 복습하도록한다.


// 오늘은 GridStack이라 불리는 새로운 타입의 스택 만드는 법을 알려주겠다.
// 그럼 다음 시간에 알려주도록 하겠다...
// 자세한 내용은 Project5에서 다룬다.

import SwiftUI

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0 ..< rows) { row in
                HStack {
                    ForEach(0 ..< self.columns) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }
    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
}

struct ContentView: View {
    var body: some View {
        GridStack(rows: 4, columns: 4) { row, col in
            HStack {
                Image(systemName: "\(row * 4 + col).circle")
                Text("R\(row) C\(col)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
