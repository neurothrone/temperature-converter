//
//  TemperatureService.swift
//  UnitConverter
//
//  Created by Zaid Neurothrone on 2022-09-30.
//

import Foundation

struct TemperatureService {
  private static func getTemperatureOf(value: Double, from unit: TemperatureUnit) -> Temperature {
    switch unit {
    case .celsius:
      return Celsius(value: value)
    case .fahrenheit:
      return Fahrenheit(value: value)
    case .kelvin:
      return Kelvin(value: value)
    }
  }
  
  private static func getValueFrom(temperature: Temperature, to unit: TemperatureUnit) -> Double {
    switch unit {
    case .celsius:
      return temperature.celsius
    case .fahrenheit:
      return temperature.fahrenheit
    case .kelvin:
      return temperature.kelvin
    }
  }
  
  static func convert(value: Double, from: TemperatureUnit, to unit: TemperatureUnit) -> Double {
    let temperature: Temperature = getTemperatureOf(value: value, from: from)
    return getValueFrom(temperature: temperature, to: unit)
  }
}
