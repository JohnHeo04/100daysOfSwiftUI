//
//  ContentView.swift
//  day28_pro4_pa3
//
//  Created by John Hur on 2021/04/30.
//
//  Challenges
//  1. 각 VStack을 Section으로 바꾸기
//     Refe.Day16,17,18
//  2. "Number of cups" Steppers를 Picker메소드로 똑같은 범위 보여주기
//  3. 위의 "Calculate"버튼은 없애고 아래에 추천 취침시간을 나이스하고 큰 폰트를 이용하여 보여주기

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView {
            Form {
                Section (header: Text("When do you want to wake up?").font(.headline)) {DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                    .datePickerStyle(WheelDatePickerStyle())
                }
                
//                VStack(alignment: .leading, spacing: 0) {
//                    Text("When do you want to wake up?")
//                        .font(.headline)
//
//                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
//                        .labelsHidden()
//
//                        .datePickerStyle(WheelDatePickerStyle())
//                }
                Section (header: Text("Desired amount of sleep").font(.headline)) {
                    Stepper(value: $sleepAmount, in: 4...12, step: 0.25) { Text("\(sleepAmount, specifier: "%g") hours")}
                }
//                VStack(alignment: .leading, spacing: 0) {
//                    Text("Desired amount of sleep")
//                        .font(.headline)
//
//                    Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
//                        Text("\(sleepAmount, specifier: "%g") hours")
//                    }
//                }
                
//                VStack(alignmen)t: .leading, spacing: 0) {
//                    Text("Daily coffee intake")
//                        .font(.headline)
//
//                    Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
//                        Text("\(sleepAmount, specifier: "%g") hours")
//                    }
//                }
                
                // 아직
                Section (header: Text("Daily coffee intake").font(.headline)) {
                    Stepper(value: $coffeeAmount, in: 1...20) {
                        if coffeeAmount == 1 {
                            Text("1 cup")
                        } else {
                            Text("\(coffeeAmount) cups")
                        }
                    }
                }
                // 피커로 바꾸기, I donna
//                Section (header: Text("Daily coffee intake").font(.headline)) {
//                    Picker(selection: $coffeeAmount, label: Text("plz")) {
//                        ForEach(1 ..< 20) {
//                            Text(20)
//                        }
//                    }
//                }
                
                
//                VStack(alignment: .leading, spacing: 0) {
//                    Text("Daily coffee intake")
//                        .font(.headline)
//
//                    Stepper(value: $coffeeAmount, in: 1...20) {
//                        if coffeeAmount == 1 {
//                            Text("1 cup")
//                        } else {
//                            Text("\(coffeeAmount) cups")
//                        }
//                    }
//                }
                
//                VStack(alignment: .leading, spacing: 0){
//                    Text("Ideal Bedtime..")
//                        .font(.headline)
//                    // put into here Calculation Value
//                }
                Section(header: Text("Your ideal bedtime is...").font(.headline)) {
                    Text("\(calculateBedtimes)")
                }
                
            }
            .navigationBarTitle("BetterRest")
//            .navigationBarItems(trailing: Button(action: calculateBedtimes) {
//                Text ("Calculate")
//                }
//            )
//            .alert(isPresented: $showingAlert) {
//                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
//            }
        }
    }
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }
    
var calculateBedtimes: String {
            let model = SleepCalculator()
            
            let components = Calendar.current.dateComponents([.hour,.minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
        var message: String
            do {
                let prediction = try
                    model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
                
                let sleepTime = wakeUp - prediction.actualSleep
                
                let formatter = DateFormatter()
                formatter.timeStyle = .short
                
//                alertMessage = formatter.string(from: sleepTime)
//                alertTitle = "Your ideal bedtime is..."
                message = formatter.string(from: sleepTime)
            } catch {
                message = "Error"
//                alertTitle = "Error"
//                alertMessage = "Sorry, there was a problem calculating your bedtime."
            }
        return message
//            showingAlert = true
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
