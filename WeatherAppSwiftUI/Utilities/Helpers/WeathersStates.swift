//
//  WeathersIds.swift
//  WeatherAppSwiftUI
//
//  Created by Cesar Humberto Grifaldo Garcia on 28/09/25.
//
import Foundation

enum WeatherState {
    case thunderStorm
    case drizzle(Bool)
    case rain(Bool)
    case snow
    case atmosphere(Atmosphere)
    case clear(Bool)
    case cloud(Bool)
    case unknown
    
    enum Atmosphere {
        case mist
        case smoke
        case haze
        case dust
        case fog
        case sand
        case ash
        case squall
        case tornado
    }
    
    static func getWeatherStateIconName(weatherState: WeatherState) -> String {
        return weatherState.currentWeatherStateIconName
    }
    
    static func classifyWeatherState(id: Int, isDay: Bool) -> WeatherState {
        switch id {
        case 200...299:
            return .thunderStorm
        case 300...399:
            return .drizzle(isDay)
        case 500...599:
            return .rain(isDay)
        case 600...699:
            return .snow
        case 700...799:
            return .atmosphere(.ash)
        case 800:
            return .clear(isDay)
        case 801...899:
            return .cloud(isDay)
        default:
            return .unknown
            
        }
    }
    
    private var currentWeatherStateIconName: String {
        switch self {
        case .thunderStorm:
            return "moon-thunder-rain"
        case .drizzle(let isDay):
            return isDay ? "sun-cloud-mid-rain" : "moon-cloud-mid-rain"
        case .rain(let isDay):
            return isDay ? "sun-cloud-angled-rain" : "moon-cloud-angled-rain"
        case .snow:
            return "tornado"
        case .atmosphere(_):
            return "tornado"
        case .clear(let isDay):
            return isDay ? "sun-clear-sky" : "moon-clear-sky"
        case .cloud(let isDay):
            return isDay ? "sun-cloud": "moon-cloud"
        case .unknown:
            return "tornado"
        }
    }
}
