//
//  ConditionsView.swift
//  FTWeather
//
//  Created by Fito Toledano on 2/5/21.
//

import SwiftUI

struct ConditionsView: View {
    
    @Binding var conditionCode: String
    
    var body: some View {
        Image(systemName: "sun.max") // to work on these,
            .resizable()
            .frame(width: 75, height: 75, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .foregroundColor(.white)
    }
}
