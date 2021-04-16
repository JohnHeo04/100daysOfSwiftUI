//
//  ContentView.swift
//  Own_WeSplit_App_Day19

//  100daysOfSwiftUI
//  Day19 : Challenge day

//
//  Created by John Hur on 16/04/2021.
//  Copyright © 2021 JohnHur. All rights reserved.
//
//  My Challenge : Volume conversion
//  users choose - milliliters, liters, cubic inch (in3) , pints (pt), or gallons (gal).
//  1. 인풋 단위 나누기
//  2. 아웃풋 단위 분류
//  3. 사용자가 어디에 숫자를 입력할지 만들기
//  4. 최종 변환값을 보여주기

//  Input값 기준을 ml(milliliters)로 할 예정임
//  1052ml 입력
//  L단위 또는 그 외의 cubic inch, pints 등을 선택하게 됨
//  Output 1.052ml 반환

//  Unit
//  Input
//  1052 ml

//  Output
//  1.052 liter     -     divide by 1000
//  62.19698 cubic inch     -     divide the volume value by 16.387
//  2.223272 pt     -     divide by 473
//  0.277909 gallon     -     divide by 3785

import SwiftUI

struct ContentView: View {
    // Input : Volume
    @State private var checkVolume = ""
    
    @State private var volumeConvert = 0
    
    // volume 변환 값이 안에 들어 가게 됨
    let volumeConverts = [1000, 16.387, 473, 3785]
    
    var totalVolume: Double {
        
        let volumeSelection = Double(volumeConverts[volumeConvert])
        // 1000 선택
        // volumeSelection = 1000
        
        let orderVolume = Double(checkVolume) ?? 0
        // Input = 1052
        // orderVolume = 1052
        
        let volumeValue = orderVolume / volumeSelection
        // 1052 / 1000
        // volumeValue = 1.052
        return volumeValue
    }
    
//    var totalVolume: Double {
//
//
//    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Volume", text: $checkVolume)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("What unit do you want to convert to?")) {
                    Picker("Tip Percentage", selection: $volumeConvert) {
                        ForEach(0 ..< volumeConverts.count) {
                            Text("\(self.volumeConverts[$0], specifier: "%.1f")")
                        }
                    }
                .pickerStyle(SegmentedPickerStyle())
            }
                // Output 나오는 공간
                Section {
                    Text("\(totalVolume, specifier: "%.3f")")
                }
            }
            .navigationBarTitle("Volume Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

