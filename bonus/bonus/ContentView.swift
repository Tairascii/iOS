//
//  ContentView.swift
//  bonus
//
//  Created by Tair Sairanbekov on 22.04.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack{
            BackgroundView(topColor: isNight ? .black : .blue, bottomColor: isNight ? .gray : Color("lightBlue"))
            VStack{
                CityView(city: "Cupertino, CA")
                MainView(image: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 89)
                HStack(spacing: 15){
                    WeatherView(days: "TUE", images: "cloud.sun.fill", temperatures: 79)
                    WeatherView(days: "WD", images: "cloud.sun.fill", temperatures: 74)
                    WeatherView(days: "THU", images: "wind", temperatures: 70)
                    WeatherView(days: "FRI", images: "wind.snow", temperatures: 70)
                    WeatherView(days: "SAT", images: "cloud.sun.fill", temperatures: 76)
                    
                }
                Spacer()
                
                Button{
                    isNight.toggle()
                } label:{
                    Text("Change day time")
                        .frame(width: 260, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.white)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .cornerRadius(10)
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

struct WeatherView: View {
    var days: String
    var images: String
    var temperatures: Int
    var body: some View {
        VStack{
            Text(days)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: images)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperatures)°")
                .font(.system(size: 28, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityView: View {
    
    var city: String
    
    var body: some View {
        Text(city)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainView: View {
    
    var image: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10){
            Image(systemName: image)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 60, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}
