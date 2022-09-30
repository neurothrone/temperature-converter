//
//  Temperature.swift
//  UnitConverter
//
//  Created by Zaid Neurothrone on 2022-09-30.
//

import Foundation

protocol Temperature {
    var value: Double { get set }
    var unit: TemperatureUnit { get }
    
    var celsius: Double { get }
    var fahrenheit: Double { get }
    var kelvin: Double { get }
}

extension Temperature {
    static func toCelsiusFrom(fahrenheit: Double) -> Double {
        (fahrenheit - 32) * 5 / 9
    }
    static func toCelsiusFrom(kelvin: Double) -> Double {
        kelvin - 273.15
    }
    static func toFahrenheitFrom(celsius: Double) -> Double {
        celsius * (9 / 5) + 32
    }
    static func toFahrenheitFrom(kelvin: Double) -> Double {
        9 / 5 * (kelvin - 273.15) + 32
    }
    static func toKelvinFrom(celsius: Double) -> Double {
        celsius + 273.15
        
    }
    static func toKelvinFrom(fahrenheit: Double) -> Double {
        5 / 9 * (fahrenheit - 32) + 273.15
    }
    
    var celsius: Double {
        if unit == .fahrenheit {
            return Self.toCelsiusFrom(fahrenheit: value)
        } else if unit == .kelvin {
            return Self.toCelsiusFrom(kelvin: value)
        }
        return value
    }
    var fahrenheit: Double {
        if unit == .celsius {
            return Self.toFahrenheitFrom(celsius: value)
        } else if unit == .kelvin {
            return Self.toFahrenheitFrom(kelvin: value)
        }
        return value
    }
    var kelvin: Double {
        if unit == .celsius {
            return Self.toKelvinFrom(celsius: value)
        } else if unit == .fahrenheit {
            return Self.toKelvinFrom(fahrenheit: value)
        }
        return value
    }
}

class BaseTemperature {
    var value: Double
    
    init(value: Double) {
        self.value = value
    }
}

class Celsius: BaseTemperature, Temperature {
    let unit = TemperatureUnit.celsius
}

class Fahrenheit: BaseTemperature, Temperature {
    let unit = TemperatureUnit.fahrenheit
}

class Kelvin: BaseTemperature, Temperature {
    let unit = TemperatureUnit.kelvin
}
