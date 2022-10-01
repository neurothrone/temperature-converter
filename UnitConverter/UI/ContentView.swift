//
//  ContentView.swift
//  UnitConverter
//
//  Created by Zaid Neurothrone on 2022-09-30.
//

import SwiftUI

struct ContentView: View {
  @FocusState private var isAmountFocused: Bool
  
  @State private var amount: Double = .zero
  @State private var fromUnit: UnitTemperature.Unit = .celsius
  @State private var toUnit: UnitTemperature.Unit = .fahrenheit
    
  var convertedResult: Double {
    guard fromUnit != toUnit else { return amount }
    
    let sourceUnit = UnitTemperature.Unit.from(unit: fromUnit)
    let targetUnit = UnitTemperature.Unit.from(unit: toUnit)
    
    let sourceTemp = Measurement(value: amount, unit: sourceUnit)
    return sourceTemp.converted(to: targetUnit).value
  }
  
  var body: some View {
    NavigationStack {
      form
        .navigationTitle("Unit Converter")
        .toolbar {
          ToolbarItemGroup(placement: .keyboard) {
            Spacer()
            Button("Done") {
              isAmountFocused = false
            }
            .buttonStyle(.borderedProminent)
          }
        }
    }
  }
  
  var form: some View {
    Form {
      Section {
        TextField(
          "Amount",
          value: $amount,
          format: .currency(code: Locale.current.identifier)
        )
        .focused($isAmountFocused)
        .keyboardType(.decimalPad)
      } header: {
        HeaderText("Amount to convert (\(fromUnit.symbol))")
      }
      
      TemperaturePickerView("Temperature to convert from", selection: $fromUnit)
      TemperaturePickerView("Temperature to convert to", selection: $toUnit)
      
      Section {
        ResultTextView(value: convertedResult)
      } header: {
        HeaderText("Result (\(toUnit.symbol))")
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
