//
//  Double+FarenheitExtension.swift
//  WeatherAppSwiftUI
//
//  Created by Cesar Humberto Grifaldo Garcia on 27/09/25.
//
import Foundation

extension Double {
    var toCelsius: String {
        let celsius = self - 273.15
        return "\(Int(celsius))°"
    }
}
