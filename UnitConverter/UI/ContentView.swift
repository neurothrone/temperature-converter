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
  @State private var fromUnit: TemperatureUnit = .celsius
  @State private var toUnit: TemperatureUnit = .fahrenheit
  
  var result: Double {
    TemperatureService.convert(
      value: amount,
      from: fromUnit,
      to: toUnit
    )
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
        ResultText(value: result)
        Text(result, format: .number)
      } header: {
        HeaderText("Result (\(toUnit.symbol))")
      }
    }
  }
}

struct ResultText: View {
  let value: Double
  
  var body: some View {
    Text(value, format: .number)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
