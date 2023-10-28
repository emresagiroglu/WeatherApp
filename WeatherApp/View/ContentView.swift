

import SwiftUI

struct ContentView: View {
    
    @StateObject var locationService = LocationService()
    var weatherService = WeatherService()
    @State var weather : ResponseBody?
    
    var body: some View {
        
        VStack {
            
            if let location = locationService.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                    
                } else {
                    LoadingView()
                        .task {
                            do {
                                weather = try await weatherService.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print("Error getting weather \(error)")
                            }
                        }
                }
                     } else {
                    if locationService.isLoading {
                        LoadingView()
                    } else {
                        WelcomeView()
                            .environmentObject(locationService)
                    }
                }
            
            }
        .frame(maxWidth : .infinity, maxHeight: .infinity)
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
        
    }
}

#Preview {
    ContentView()
}


