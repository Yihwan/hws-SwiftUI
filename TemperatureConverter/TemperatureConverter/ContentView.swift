//
//  ContentView.swift
//  TemperatureConverter
//
//  Created by Alter Ego on 11/11/19.
//  Copyright © 2019 Yihwan Kim. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var temperatureInput = ""
    @State private var conversionInput = 0
    @State private var conversionOutput = 0
    
    var conversionOptions = ["Fahrenheit (F)", "Celsius (C)", "Kelvin (K)"]
    
    var convertedTemperature: Double {
        if temperatureInput == "" {
            return 0
        }
        
        let formattedInput = Double(temperatureInput) ?? 0
        
        if formattedInput == 0 {
            return 0
        }
        
        var temperatureInF = formattedInput
        
        if conversionInput == 1 {
            temperatureInF = formattedInput * (9/5) + 32
        } else if conversionInput == 2 {
            temperatureInF = formattedInput * (9/5) - 459.67
        }
        
        if conversionOutput == 1 {
            return (temperatureInF - 32) * (5/9)
        } else if conversionOutput == 2 {
            return (temperatureInF + 459.67) * (5/9)
        }
        
        return temperatureInF
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Select input unit")) {
                    Picker("Conversions", selection: $conversionInput) {
                        ForEach(0 ..< conversionOptions.count) {
                            Text("\(self.conversionOptions[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Temperature in \(conversionOptions[conversionInput])")) {
                    TextField("Enter a temperature", text: $temperatureInput)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Select output unit")) {
                    Picker("Conversions", selection: $conversionOutput) {
                        ForEach(0 ..< conversionOptions.count) {
                            Text("\(self.conversionOptions[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Temperature in \(conversionOptions[conversionOutput])")) {
                    Text("\(convertedTemperature, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("Temperature Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
