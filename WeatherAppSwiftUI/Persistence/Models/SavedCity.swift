//
//  SavedCities.swift
//  WeatherAppSwiftUI
//
//  Created by Cesar Humberto Grifaldo Garcia on 05/10/25.
//
import Foundation
import SwiftData

@Model
final class SavedCity {
    @Attribute(.unique) var name: String
    var lastUpdated: Date

    init(name: String, lastUpdated: Date = .now) {
        self.name = name
        self.lastUpdated = lastUpdated
    }
}

