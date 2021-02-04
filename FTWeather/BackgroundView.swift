//
//  BackgroundView.swift
//  FTWeather
//
//  Created by Fito Toledano on 2/4/21.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]),
                       startPoint: .topLeading, endPoint: . bottomTrailing)
            .ignoresSafeArea(.all)
    }
}
