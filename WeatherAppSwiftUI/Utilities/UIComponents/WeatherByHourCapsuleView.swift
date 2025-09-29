//
//  WeatherByHourCapsuleView.swift
//  WeatherAppSwiftUI
//
//  Created by Cesar Humberto Grifaldo Garcia on 20/09/25.
//

import SwiftUI

struct WeatherByHourCapsuleView: View {
    let capsuleViewModel: WeatherByHourCapsuleViewModel
    var body: some View {
        VStack(spacing: 12) {
            Text(FormatterHelper.shared.convertUnixToLocalHour(capsuleViewModel.hour))
                .font(.system(size: 15, weight: .semibold))
                .foregroundStyle(Color.white)
            VStack(spacing: 0) {
                Image(capsuleViewModel.weatherIcon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 32, height: 32)
                Text(capsuleViewModel.precipitationProbability)
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundStyle(Color.Resolved(red: 64/255, green: 203/255, blue: 216/255))
            }
            Text(capsuleViewModel.temperature.toCelsius)
                .font(.system(size: 20, weight: .regular))
                .foregroundStyle(Color.white)
        }
        .padding(.vertical, 18)
        .padding(.horizontal, 10)
        .background(
            LinearGradient(
                colors: [
                    Color(red: 46/255, green: 51/255, blue: 90/255).opacity(0.65),
                    Color(red: 69/255, green: 39/255, blue: 139/255).opacity(0.25)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .clipShape(Capsule())
        .overlay(
            Capsule()
                .stroke(
                    LinearGradient(
                        colors: [Color.white.opacity(0.5), Color.clear],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 1
                )
        )
        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 2, y: 2)
    }
}


#Preview {
    ZStack {
        LinearGradient(colors: [Color.purple, Color.blue], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
        WeatherByHourCapsuleView(capsuleViewModel: WeatherByHourCapsuleViewModel(weatherByHour: Current(dt: 56, sunrise: 56, sunset: 56, temp: 286.9, feelsLike: 34.9, pressure: 2, humidity: 2, dewPoint: 2.9, uvi: 23.0, clouds: 1, visibility: 2, windSpeed: 12.9, windDeg: 1, windGust: 8.9, weather: [Weather](), rain: nil, pop: nil)))
            
    }
}
