//
//  ContentView.swift
//  WeatherApp
//
//  Created by Emre Sağıroğlu on 27.10.2023.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    
    @EnvironmentObject var locationService : LocationService
    
    var body: some View {
        
        VStack{
            VStack(spacing:20){
                Text("Welcome to the Weather App")
                    .bold().font(.title)
                Text("Please share your current location to get the weather data on your phone")
                    .padding()
                
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation) {
                locationService.requestLocation()
            }
            .clipShape(.capsule)
            .symbolVariant(.fill)
            .foregroundStyle(.white)
            
            
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}
#Preview {
    WelcomeView()
}

