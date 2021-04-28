//
//  ContentView.swift
//  day26 : Working with dates
//
//  Created by JohnHur on 2021/04/28.
//
//  86,400 seconds = 1day


import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date()
    
    var body: some View {
//        단락이 넘어 갈 수록 애플에서는 개발자에게 쉬운방법을 제공해준다는걸 볼 수 있음.
//        var components = DateComponents()
//        components.hour = 8
//        components.minute = 0
//        let date = Calendar.current.date(from: components) ?? Date()
        
//        let components = Calendar.current.dateComponents([.hour, .minute], from: someDate)
//        let hour = components.hour ?? 0
//        let minute = components.minute ?? 0
        
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        let dateString = formatter.string(from: Date())
        
        
        return DatePicker("Please enter a date", selection: $wakeUp, displayedComponents: .hourAndMinute)
                .labelsHidden()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
