//
//  MockData.swift
//  FTWeather
//
//  Created by Fito Toledano on 2/4/21.
//

import Foundation

struct MockData {
    static let brussels = City(cityName: "Brussels", stateCode: "Brussels", countryCode: "BE")
    static let brusselsEndpoint = "https://api.openweathermap.org/data/2.5/weather?q=\(brussels.cityName)&units=metric&appid=\(APIConstants.APIkey)"
    static let londonEndpoint = "https://api.openweathermap.org/data/2.5/weather?q=London&appid=\(APIConstants.APIkey)"
}
