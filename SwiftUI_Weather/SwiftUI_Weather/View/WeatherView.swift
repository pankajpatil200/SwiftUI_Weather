//
//  WeatherView.swift
//  SwiftUI_Weather
//
//  Created by Pankaj Patil on 26/12/2023.
//

import SwiftUI

struct WeatherView: View {
    
    @StateObject var weatherModelView = WeatherModelView()

    @State private var isNightMode = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: (isNightMode == false ?[.blue, .white]:[.black, .gray])), startPoint: .topLeading, endPoint: .bottomLeading)
                .ignoresSafeArea()
            
            VStack {
                Text("London ")
                    .font(.largeTitle)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.white)
                    .padding()
                
                VStack(spacing: 5) {
                    Image(systemName: "cloud.sun.fill")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                    Text("25°")
                        .font(.system(size: 60))
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                }
                
                Spacer()
                HStack(spacing: 30) {
                   
                    ForEach(weatherModelView.weatherModel, id: \.self) { weather in
                        VStack(spacing: 10) {
                            TemperatureView(day: weather.day, image: weather.image, temperature: weather.temp)
                        }
                    }
                }
                Spacer()
                Button {
                    isNightMode.toggle()
                } label: {
                    Text("Change Time for Day")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(.blue)
                }
                .frame(width: 300, height: 50)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 4))


                Spacer()
            }
        }
    }
}

#Preview {
    WeatherView()
}

struct TemperatureView: View {
    let day: String
    let image: String
    let temperature: String
    var body: some View {
        
            Text(day)
                .font(.callout)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            VStack(spacing: 0) {
                Image(systemName: image)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
            }
            
            Text("\(temperature)")
                .font(.system(size: 25))
                .fontWeight(.semibold)
                .foregroundStyle(.white)
        
    }
}
