//
//  WeatherModel.swift
//  SwiftUI_Weather
//
//  Created by Pankaj Patil on 26/12/2023.
//

import Foundation
import SwiftUI

class WeatherModelView: ObservableObject {
    
    @Published var weatherModel = [WeatherModel]()
    
    init() {

        self.weatherModel  = [WeatherModel(day:"SUN", image:"cloud.sun.rain.fill", temp: "35°"),
                          WeatherModel(day:"MON", image:"cloud.sun.bolt.fill", temp: "34°"),
                          WeatherModel(day:"TUE", image:"cloud.sun.fill", temp: "38°"),
                          WeatherModel(day:"WED", image:"cloud.sun.bolt.fill", temp: "28°"),
                          WeatherModel(day:"THU", image:"cloud.sun.rain.fill", temp: "30°")]
    }
    
}
