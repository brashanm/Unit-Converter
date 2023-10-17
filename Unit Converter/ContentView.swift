//
//  ContentView.swift
//  Unit Converter
//
//  Created by Brashan Mohanakumar on 2023-10-17.
//

import SwiftUI

struct ContentView: View {
    @State private var currentAmount: Double = 0
    @State private var currentUnit: String = ""
    @State private var convertedUnit: String = ""
    let units = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var convertedAmount: Double {
        if currentUnit == convertedUnit {
            return Double(currentAmount)
        }
        else if (currentUnit == "Celsius" && convertedUnit == "Fahrenheit") {
            return ((currentAmount * 9) / 5) + 32
        }
        if (currentUnit == "Celsius" && convertedUnit == "Kelvin") {
            return currentAmount + 273.15
        }
        if (currentUnit == "Fahrenheit" && convertedUnit == "Celsius") {
            return (((currentAmount - 32) * 5) / 9)
        }
        if (currentUnit == "Fahrenheit" && convertedUnit == "Kelvin") {
            return (((currentAmount - 32) * 5) / 9) + 273.15
        }
        if (currentUnit == "Kelvin" && convertedUnit == "Celsius") {
            return currentAmount - 273.15
        }
        if (currentUnit == "Kelvin" && convertedUnit == "Fahrenheit") {
            return (((currentAmount - 273.15) * 9) / 5) + 32
        }
        return 0.0
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("From:", selection: $currentUnit) {
                        ForEach(units, id:\.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    TextField("Amount", value: $currentAmount, format: .number)
                        .keyboardType(.decimalPad)
                }
                Section {
                    Picker("From:", selection: $convertedUnit) {
                        ForEach(units, id:\.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Text(convertedAmount, format: .number)
                }
            }
            .navigationTitle("Unit Conversion")
        }
    }
}

#Preview {
    ContentView()
}
