//
//  WeatherSummaryDataView.swift
//  WeatherAppSwiftUI
//
//  Created by Cesar Humberto Grifaldo Garcia on 20/09/25.
//

import SwiftUI

struct WeatherSummaryDataView<Content: View>: View {
    @GestureState private var dragOffset = CGSize.zero
    @State private var position: CGFloat? = nil
    
    var content: () -> Content
    
    var body: some View {
        GeometryReader { proxy in
            let screenHeight = proxy.size.height
            let collapsed = screenHeight * 0.60
            let expanded: CGFloat = 100
            VStack {
                Capsule()
                    .fill(Color.black.opacity(0.3))
                    .frame(width: 48, height: 5)
                    .padding(.top, 8)
                HStack(spacing: 96) {
                    Button("Hourly Forecast") {
                        
                    }
                    .font(.system(size: 15))
                    .fontWeight(.semibold)
                    .foregroundStyle(Color(red: 235/255, green: 235/255, blue: 245/255)).opacity(0.6)
                    Button("Weekly Forecast") {
                        
                    }
                    .font(.system(size: 15))
                    .fontWeight(.semibold)
                    .foregroundStyle(Color(red: 235/255, green: 235/255, blue: 245/255)).opacity(0.6)
                }
                Divider()
                    .overlay(
                        LinearGradient(
                            colors: [Color.white.opacity(0.7), Color.white.opacity(0.2)],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                        .frame(height: 1),
                        alignment: .bottom
                    )
                content()
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(maxHeight: .infinity, alignment: .top)
            .background(.ultraThinMaterial)
            .cornerRadius(48)
            .border(LinearGradient(
                colors: [Color.white, Color.white],
                startPoint: .topLeading,
                endPoint: .topTrailing
            ), width: 1).cornerRadius(48)
                .offset(y: (position ?? collapsed) + dragOffset.height)
                .gesture(
                    DragGesture()
                        .updating($dragOffset) { value, state, _ in
                            state = value.translation
                        }
                        .onEnded { value in
                            if value.translation.height < -100 {
                                position = expanded
                            } else {
                                position = collapsed
                            }
                        }
                )
                .animation(.spring(), value: position)
                .onAppear {
                    position = collapsed
                }
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    ZStack {
        LinearGradient(colors: [Color.purple, Color.blue], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
        WeatherSummaryDataView {
            ScrollView(.vertical) {
                VStack {
                    ScrollView(.horizontal) {
                        HStack(spacing: 12) {
                            WeatherByHourCapsuleView(capsuleViewModel: WeatherByHourCapsuleViewModel(weatherByHour: Current(dt: 56, sunrise: 56, sunset: 56, temp: 56.9, feelsLike: 34.9, pressure: 2, humidity: 2, dewPoint: 2.9, uvi: 23.0, clouds: 1, visibility: 2, windSpeed: 12.9, windDeg: 1, windGust: 8.9, weather: [Weather](), rain: nil, pop: nil)))
                            WeatherByHourCapsuleView(capsuleViewModel: WeatherByHourCapsuleViewModel(weatherByHour: Current(dt: 56, sunrise: 56, sunset: 56, temp: 56.9, feelsLike: 34.9, pressure: 2, humidity: 2, dewPoint: 2.9, uvi: 23.0, clouds: 1, visibility: 2, windSpeed: 12.9, windDeg: 1, windGust: 8.9, weather: [Weather](), rain: nil, pop: nil)))
                            WeatherByHourCapsuleView(capsuleViewModel: WeatherByHourCapsuleViewModel(weatherByHour: Current(dt: 56, sunrise: 56, sunset: 56, temp: 56.9, feelsLike: 34.9, pressure: 2, humidity: 2, dewPoint: 2.9, uvi: 23.0, clouds: 1, visibility: 2, windSpeed: 12.9, windDeg: 1, windGust: 8.9, weather: [Weather](), rain: nil, pop: nil)))
                            WeatherByHourCapsuleView(capsuleViewModel: WeatherByHourCapsuleViewModel(weatherByHour: Current(dt: 56, sunrise: 56, sunset: 56, temp: 56.9, feelsLike: 34.9, pressure: 2, humidity: 2, dewPoint: 2.9, uvi: 23.0, clouds: 1, visibility: 2, windSpeed: 12.9, windDeg: 1, windGust: 8.9, weather: [Weather](), rain: nil, pop: nil)))
                            WeatherByHourCapsuleView(capsuleViewModel: WeatherByHourCapsuleViewModel(weatherByHour: Current(dt: 56, sunrise: 56, sunset: 56, temp: 56.9, feelsLike: 34.9, pressure: 2, humidity: 2, dewPoint: 2.9, uvi: 23.0, clouds: 1, visibility: 2, windSpeed: 12.9, windDeg: 1, windGust: 8.9, weather: [Weather](), rain: nil, pop: nil)))
                            WeatherByHourCapsuleView(capsuleViewModel: WeatherByHourCapsuleViewModel(weatherByHour: Current(dt: 56, sunrise: 56, sunset: 56, temp: 56.9, feelsLike: 34.9, pressure: 2, humidity: 2, dewPoint: 2.9, uvi: 23.0, clouds: 1, visibility: 2, windSpeed: 12.9, windDeg: 1, windGust: 8.9, weather: [Weather](), rain: nil, pop: nil)))
                            WeatherByHourCapsuleView(capsuleViewModel: WeatherByHourCapsuleViewModel(weatherByHour: Current(dt: 56, sunrise: 56, sunset: 56, temp: 56.9, feelsLike: 34.9, pressure: 2, humidity: 2, dewPoint: 2.9, uvi: 23.0, clouds: 1, visibility: 2, windSpeed: 12.9, windDeg: 1, windGust: 8.9, weather: [Weather](), rain: nil, pop: nil)))
                            WeatherByHourCapsuleView(capsuleViewModel: WeatherByHourCapsuleViewModel(weatherByHour: Current(dt: 56, sunrise: 56, sunset: 56, temp: 56.9, feelsLike: 34.9, pressure: 2, humidity: 2, dewPoint: 2.9, uvi: 23.0, clouds: 1, visibility: 2, windSpeed: 12.9, windDeg: 1, windGust: 8.9, weather: [Weather](), rain: nil, pop: nil)))
                            WeatherByHourCapsuleView(capsuleViewModel: WeatherByHourCapsuleViewModel(weatherByHour: Current(dt: 56, sunrise: 56, sunset: 56, temp: 56.9, feelsLike: 34.9, pressure: 2, humidity: 2, dewPoint: 2.9, uvi: 23.0, clouds: 1, visibility: 2, windSpeed: 12.9, windDeg: 1, windGust: 8.9, weather: [Weather](), rain: nil, pop: nil)))
                            WeatherByHourCapsuleView(capsuleViewModel: WeatherByHourCapsuleViewModel(weatherByHour: Current(dt: 56, sunrise: 56, sunset: 56, temp: 56.9, feelsLike: 34.9, pressure: 2, humidity: 2, dewPoint: 2.9, uvi: 23.0, clouds: 1, visibility: 2, windSpeed: 12.9, windDeg: 1, windGust: 8.9, weather: [Weather](), rain: nil, pop: nil)))
                            WeatherByHourCapsuleView(capsuleViewModel: WeatherByHourCapsuleViewModel(weatherByHour: Current(dt: 56, sunrise: 56, sunset: 56, temp: 56.9, feelsLike: 34.9, pressure: 2, humidity: 2, dewPoint: 2.9, uvi: 23.0, clouds: 1, visibility: 2, windSpeed: 12.9, windDeg: 1, windGust: 8.9, weather: [Weather](), rain: nil, pop: nil)))
                            WeatherByHourCapsuleView(capsuleViewModel: WeatherByHourCapsuleViewModel(weatherByHour: Current(dt: 56, sunrise: 56, sunset: 56, temp: 56.9, feelsLike: 34.9, pressure: 2, humidity: 2, dewPoint: 2.9, uvi: 23.0, clouds: 1, visibility: 2, windSpeed: 12.9, windDeg: 1, windGust: 8.9, weather: [Weather](), rain: nil, pop: nil)))
                            WeatherByHourCapsuleView(capsuleViewModel: WeatherByHourCapsuleViewModel(weatherByHour: Current(dt: 56, sunrise: 56, sunset: 56, temp: 56.9, feelsLike: 34.9, pressure: 2, humidity: 2, dewPoint: 2.9, uvi: 23.0, clouds: 1, visibility: 2, windSpeed: 12.9, windDeg: 1, windGust: 8.9, weather: [Weather](), rain: nil, pop: nil)))
                        }
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                    }
                }
            }
            .padding(.top, 19)
            .padding(.bottom, 100)
        }
    }
}
