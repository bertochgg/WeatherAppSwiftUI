//
//  WeatherByHourCapsuleView.swift
//  WeatherAppSwiftUI
//
//  Created by Cesar Humberto Grifaldo Garcia on 20/09/25.
//

import SwiftUI

import SwiftUI

struct WeatherByHourCapsuleView: View {

    var body: some View {
        GeometryReader { proxy in
            let capsuleWidth = proxy.size.width * 0.154
            let capsuleHeight = proxy.size.height * 0.173

            VStack(spacing: 12) {
                Text("12 AM")
                Image(systemName: "cloud.fill")
                Text("30%")
                Text("19°")
            }
            .frame(width: capsuleWidth, height: capsuleHeight)
            .background(
                Capsule()
                    .fill(.ultraThinMaterial)
            )
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
}

//struct WeatherByHourCapsuleViewv1: View {
//    var body: some View {
//        VStack(spacing: 12) {
//            Text("12 AM")
//            Image(systemName: "cloud.fill")
//            Text("30%")
//            Text("19°")
//        }
//        .padding(.vertical, 18)
//        .padding(.horizontal, 10)
//        .background(
//            Capsule()
//                .fill(.ultraThinMaterial)
//        )
//        .overlay(
//            Capsule()
//                .stroke(
//                    LinearGradient(
//                        colors: [Color.white.opacity(0.5), Color.clear],
//                        startPoint: .topLeading,
//                        endPoint: .bottomTrailing
//                    ),
//                    lineWidth: 1
//                )
//        )
//        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 2, y: 2)
//    }
//}


#Preview {
    ZStack {
        LinearGradient(colors: [Color.purple, Color.blue], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
        WeatherByHourCapsuleView()
            
    }
}
