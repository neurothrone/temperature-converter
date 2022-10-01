//
//  UnitTemperature+Extensions.swift
//  UnitConverter
//
//  Created by Zaid Neurothrone on 2022-10-01.
//

import Foundation

extension UnitTemperature {
  enum Unit: String {
    case celsius = "Celsius"
    case fahrenheit = "Fahrenheit"
    case kelvin = "Kelvin"
  }
}

extension UnitTemperature.Unit: Identifiable, CaseIterable {
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
  
  static func from(unit: UnitTemperature.Unit) -> UnitTemperature {
    switch unit {
    case UnitTemperature.Unit.celsius:
      return .celsius
    case UnitTemperature.Unit.fahrenheit:
      return .fahrenheit
    case UnitTemperature.Unit.kelvin:
      return .kelvin
    }
  }
}
