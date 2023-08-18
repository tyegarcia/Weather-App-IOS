//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by Tye Garcia on 8/17/23.
//

import SwiftUI

struct WeatherButton: View {

    var name: String
    var backgroundColor: Color
    
    
    var body: some View {
        Text(name)
                .frame(width: 280, height: 50)
                .background(backgroundColor.gradient)
                .font(.system(size: 20, weight: .bold, design: .default))
                .cornerRadius(10)
    
    }
}

struct WeatherButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.blue // Background
                .edgesIgnoringSafeArea(.all)
            
            
            WeatherButton(name: "Change Day Time", backgroundColor: .white)
        }
    }
}

