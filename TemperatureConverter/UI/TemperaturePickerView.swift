//
//  TemperaturePickerView.swift
//  UnitConverter
//
//  Created by Zaid Neurothrone on 2022-09-30.
//

import SwiftUI

struct TemperaturePickerView: View {
  
  @Binding var selection: UnitTemperature.Unit
  
  let text: String
  
  init(_ text: String, selection: Binding<UnitTemperature.Unit>) {
    self.text = text
    _selection = selection
  }
  
  var body: some View {
    Section {
      Picker(text, selection: $selection) {
        ForEach(UnitTemperature.Unit.allCases) {
          Text($0.rawValue)
        }
      }
      .pickerStyle(.segmented)
    } header: {
      Text(text)
        .textCase(.none)
    }
  }
}

struct TemperaturePickerView_Previews: PreviewProvider {
  @State private static var selection: UnitTemperature.Unit = .fahrenheit
  
  static var previews: some View {
    Form {
      TemperaturePickerView("Temperature", selection: $selection)
    }
  }
}
