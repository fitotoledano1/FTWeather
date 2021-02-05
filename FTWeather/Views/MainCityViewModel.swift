//
//  MainCityViewModel.swift
//  FTWeather
//
//  Created by Fito Toledano on 2/4/21.
//

import Foundation

enum FTWError: String, Error {
    case invalidUrl = ""
}

final class MainCityViewModel: ObservableObject {
    
    @Published var temperature: Double = 0
    @Published var city: String?
    @Published var state: String?
    @Published var country: String?
    
    @Published var isLoading: Bool = false
    
    func stopLoading() {
        DispatchQueue.main.async { self.isLoading = false }
    }
        
    func fetchMainCityWeather() {
        
        isLoading = true
        
        guard let url = URL(string: MockData.brusselsEndpoint) else {
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error == nil {
                
                guard let response = response as? HTTPURLResponse else {
                    return
                }
                
                switch response.statusCode {
                case 200:
                    print("OK")
                case 401:
                    print("Invalid API key")
                    self.stopLoading()
                    return
                    
                default:
                    print("Unable to complete")
                    self.stopLoading()
                    return
                }
                
                guard let data = data else {
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let weather = try decoder.decode(APIResponse.self, from: data)
                    
                    let temperature = weather.main["temp"]!
                    
                    DispatchQueue.main.async {
                        self.city = "Brussels, Belgium"
                        self.temperature = temperature
                    }
                } catch {
                    
                }
                
            } else {
                print(error?.localizedDescription ?? "Couldn't retrieve error's localized description.")
            }
            DispatchQueue.main.async { self.isLoading = false }
        }
        dataTask.resume()
    }
}
