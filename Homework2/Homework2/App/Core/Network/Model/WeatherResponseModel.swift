//
//  Weather.swift
//  Homework2
//
//  Created by Sefa İbiş on 3.01.2023.
//

import Foundation


// MARK:   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation
/*
// MARK: - WeatherInfo
struct WeatherInfo: Decodable {
    let weather: [Weather]?
    let main: Main?
    let wind: Wind?
    let sys: Sys?
    let name: String?
}

// MARK: - Main
struct Main: Decodable {
    let temp, feelsLike, tempMin, tempMax: Double?
    let pressure, humidity, seaLevel, grndLevel: Int?

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
    }
}

// MARK: - Sys
struct Sys: Decodable {
    let country: String?
    let sunrise, sunset: Int?
}

// MARK: - Weather
struct Weather: Decodable {
    let id: Int?
    let main, weatherDescription, icon: String?

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

// MARK: - Wind
struct Wind: Decodable {
    let speed: Double?
    let deg: Int?
    let gust: Double?
}
*/

import Foundation

// MARK: - Welcome
struct WeatherInfo: Decodable {
    let list: [List]?
}

// MARK: - List
struct List: Decodable {
    let main: Main?
    let weather: [Weather]?
    let wind: Wind?
    
}

struct City: Decodable {
    let id: Int?
    let name: String?
    let country: String?
    let population, timezone, sunrise, sunset: Int?
}

// MARK: - Main
struct Main: Decodable {
    let temp, feelsLike, tempMin, tempMax: Double?
    let pressure, seaLevel, grndLevel, humidity: Int?
    let tempKf: Double?
}


// MARK: - Weather
struct Weather: Decodable {
    let main, description, icon: String?
}

// MARK: - Wind
struct Wind: Decodable {
    let speed: Double?
    let deg: Int?
    let gust: Double?
}



