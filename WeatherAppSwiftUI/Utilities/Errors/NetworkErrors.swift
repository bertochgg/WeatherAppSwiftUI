//
//  NetworkErrors.swift
//  WeatherAppSwiftUI
//
//  Created by Cesar Humberto Grifaldo Garcia on 27/09/25.
//

enum NetworkErrors: Error {
    case invalidURL
    case invalidResponse
    case noDataReceived
    case dataDecodingError
}
