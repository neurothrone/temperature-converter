//
//  TemperatureUnit.swift
//  UnitConverter
//
//  Created by Zaid Neurothrone on 2022-09-30.
//

import Foundation

enum TemperatureUnit: String {
  case celsius = "Celsius"
  case fahrenheit = "Fahrenheit"
  case kelvin = "Kelvin"
}

extension TemperatureUnit: Identifiable, CaseIterable {
  var id: Self { self }
  
  var symbol: String {
    switch self {
    case .celsius:
      return "°C"
    case .fahrenheit:
      return "°F"
    case .kelvin:
      return "K"
    }
  }
}
