////
////  OpenWeatherAPI.swift
////  Homework2
////
////  Created by Sefa İbiş on 3.01.2023.
////
//
//import Foundation
//import Moya
//
//let provider = MoyaProvider<OpenWeatherAPI>()
//
////Cases for different call methods
//enum OpenWeatherAPI{
//    case weatherCoordinate(latitude: Double, longitude: Double)
//    case weatherCity(cityName: String)
//    case forecastCoordinate(latitude: Double, longitude: Double)
//    case forecastCity(cityName: String)
//}
//// MARK: - TargetType
//extension OpenWeatherAPI: TargetType {
//
//    var baseURL: URL {
//        guard let url = URL(string: Constant.apiRelated.url)
//        else {
//            fatalError("Base URL not found")
//        }
//        return url
//    }
//
//    var path: String {
//        switch self {
//        case .weatherCoordinate(let latitude, let longitude):
//            return "/weather?lat=\(latitude)&lon=\(longitude)&appid=\(Constant.apiRelated.keyAPI)"
//        case .weatherCity(let cityName):
//            return "/weather?q=\(cityName)&appid=\(Constant.apiRelated.keyAPI)"
//        case .forecastCoordinate(let latitude, let longitude):
//            return "/forecast?lat=\(latitude)&lon=\(longitude)&appid=\(Constant.apiRelated.keyAPI)"
//        case .forecastCity(let cityName):
//            return "/forecast?q=\(cityName)&appid=\(Constant.apiRelated.keyAPI)"
//        }
//    }
//
//    var method: Moya.Method {
//        .get
//    }
//
//    var task: Moya.Task {
//        .requestPlain
//    }
//
//    var headers: [String : String]? {
//        nil
//    }
//    var sampleData: Data {
//        return Data()
//    }
//}
