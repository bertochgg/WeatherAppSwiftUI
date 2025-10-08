//
//  PersistanceErrors.swift
//  WeatherAppSwiftUI
//
//  Created by Cesar Humberto Grifaldo Garcia on 05/10/25.
//
import Foundation

enum PersistenceErrors: Error {
    case noDataAvailable
    case decodingError
    case encodingError
}
