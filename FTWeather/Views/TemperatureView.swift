//
//  TemperatureView.swift
//  FTWeather
//
//  Created by Fito Toledano on 2/5/21.
//

import SwiftUI

struct TemperatureView: View {
    
    @Binding var temperature: Double
    
    var body: some View {
        Text("\(String(format: "%.1f", temperature)) ºC")
            .font(.system(size: 72))
            .bold()
            .foregroundColor(.white)
    }
}
