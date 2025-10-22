//
//  weather.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 21/10/25.
//

import Foundation
import SwiftUI
import WeatherKit
import CoreLocation
internal import Combine

@MainActor
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()
    @Published var location: CLLocation?
    @Published var authorizationStatus: CLAuthorizationStatus = .notDetermined

    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationStatus = manager.authorizationStatus
    }
}


//weather viewmodel
@MainActor
class WeatherViewModel: ObservableObject {
    @Published var currentTemp: String = "--"
    @Published var condition: String = ""
    private let service = WeatherService.shared

    func fetchWeather(for location: CLLocation) async {
        do {
            let weather = try await service.weather(for: location)
            let temp = weather.currentWeather.temperature
            currentTemp = "\(temp.formatted())"
            condition = weather.currentWeather.condition.description
        } catch {
            print("Error fetching weather: \(error.localizedDescription)")
        }
    }
}


//main view
struct WeatherView: View {
    @StateObject private var locationManager = LocationManager()
    @StateObject private var weatherVM = WeatherViewModel()

    var body: some View {
        VStack(spacing: 20) {
            if let location = locationManager.location {
                Text("Fetching weather for your location...")
                    .task {
                        await weatherVM.fetchWeather(for: location)
                    }

                Text("Temperature: \(weatherVM.currentTemp)")
                    .font(.largeTitle)

                Text("Condition: \(weatherVM.condition)")
                    .font(.title3)
            } else {
                Text("Waiting for location permission...")
            }
        }
        .padding()
    }
}

#Preview {
    WeatherView()
}
