//
//  APIResponse.swift
//  FTWeather
//
//  Created by Fito Toledano on 2/4/21.
//

import Foundation

struct APIResponse: Codable {
    let coord: [String: Double]
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: [String: Double]
    let clouds: [String: Double]
    let dt: Int
    let sys: Sys
    let timezone: Int
    let id: Int
    let name: String
    let cod: Int
}

struct Main: Codable {
    let temp: Double
    let feelsLike: Double
    let tempMax: Double
    let pressure: Double
    let humidity: Double
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Sys: Codable {
    let type: Int
    let id: Int
    let country: String
    let sunrise: Int
    let sunset: Int
}


