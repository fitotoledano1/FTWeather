//
//  MainCityViewModel.swift
//  FTWeather
//
//  Created by Fito Toledano on 2/4/21.
//

import Foundation

final class MainCityViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    
    @Published var temperature: Double = 0
    @Published var condition: String = ""
    
    // For later use.
    @Published var city: String?
    @Published var state: String?
    @Published var country: String?
    
    func stopLoading() {
        DispatchQueue.main.async { self.isLoading = false }
    }
        
    func fetchMainCityWeather() {
        
        isLoading = true
        
        guard let url = URL(string: MockData.brusselsEndpoint) else {
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            
            guard let self = self else { return }
            
            if error == nil {
                
                guard let response = response as? HTTPURLResponse else {
                    self.stopLoading()
                    return
                }
                
                switch response.statusCode {
                case 200:
                    print("OK Response Status: 200")
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
                    let apiResponse = try decoder.decode(APIResponse.self, from: data)
                    
                    let temperature = apiResponse.main.temp
                    let condition = apiResponse.weather[0].main
                    
                    DispatchQueue.main.async {
                        self.city = "Brussels, Belgium"
                        self.temperature = temperature
                        self.condition = condition
                    }
                } catch let error {
                    print("There was an error decoding JSON data...", error.localizedDescription)
                }
                
            } else {
                print(error?.localizedDescription ?? "Couldn't retrieve error's localized description.")
            }
            DispatchQueue.main.async { self.isLoading = false }
        }
        dataTask.resume()
    }
}
