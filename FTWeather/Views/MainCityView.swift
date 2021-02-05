//
//  ContentView.swift
//  FTWeather
//
//  Created by Fito Toledano on 2/4/21.
//

import SwiftUI

struct MainCityView: View {
    
    @StateObject var viewModel = MainCityViewModel()
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                Spacer()
                Text("\(viewModel.city ?? "loading..")")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                
                HStack(spacing: 20) {
                    Image(systemName: "sun.max")
                        .resizable()
                        .frame(width: 75, height: 75, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                    Text("\(String(format: "%.1f", viewModel.temperature)) ºC")
                        .font(.system(size: 72))
                        .bold()
                        .foregroundColor(.white)
                }
                
                Spacer()
            }
            .padding()
        }.onAppear {
            viewModel.fetchMainCityWeather()
        }
        .redacted(reason: viewModel.isLoading ? .placeholder : []).animation(.linear, value: true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainCityView()
    }
}
