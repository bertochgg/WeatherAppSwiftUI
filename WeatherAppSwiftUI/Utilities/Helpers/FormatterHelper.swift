//
//  String+UnixFormatExtension.swift
//  WeatherAppSwiftUI
//
//  Created by Cesar Humberto Grifaldo Garcia on 27/09/25.
//
import Foundation

final class FormatterHelper {
    static let shared = FormatterHelper()
    
    private init() {}
    
    func convertUnixToLocalHour(_ unix: Int, timeZone: TimeZone = TimeZone(identifier: "America/Mexico_City")!) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(unix))
        let formatter = DateFormatter()
        formatter.timeZone = timeZone
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "ha"
        return splitHourWithSpace(formatter.string(from: date))
    }

    private func splitHourWithSpace(_ string: String) -> String {
        var result = ""
        for char in string {
            if char.isLetter, !result.isEmpty, let last = result.last, !last.isLetter {
                result.append(" ")
            }
            result.append(char)
        }
        return result
    }
}
