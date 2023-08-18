//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Tye Garcia on 8/17/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            
            VStack {
                CityTextView(cityName: "Brawley")
                    
                MainWeatherStatusView(weatherImage: isNight ? "moon.stars.fill" : "cloud.sun.fill", temp: 76)
               
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "WED", imageName: "cloud.sun.fill", temp: 90)
                    WeatherDayView(dayOfWeek: "THU", imageName: "sun.max.fill", temp: 97)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "wind.snow", temp: 85)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "sunset.fill", temp: 80)
                    WeatherDayView(dayOfWeek: "SUN", imageName: "snow", temp: 75)
                
                }
                .padding(.top, 5)
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(name: "Change Day Time", backgroundColor: .white)
                }
                
                Spacer()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temp: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 20, weight: .regular, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            Text("\(temp)°")
                .font(.system(size: 30, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    var isNight: Bool
    
    var body: some View {
        
//        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : .white]),
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing)
//        .ignoresSafeArea()
        
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding(.top, 30)
    }

}

struct MainWeatherStatusView: View {
    
    var weatherImage: String
    var temp: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: weatherImage)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
                
            
            Text("\(temp)")
                .font(.system(size: 90, weight: .medium, design: .default))
                .foregroundColor(.white)
                
            
        }
    }
}

