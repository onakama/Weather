//
//  Model.swift
//  Weather
//
//  Created by onakama on 2022/09/03.
//

import Foundation
import YumemiWeather
import UIKit

struct WeatherModel {
    let request = """
{
    "area": "tokyo",
    "date": "2020-04-01T12:00:00+09:00"
}
"""
    
    func fatch() throws -> Response{
        do {
            let responseData = try YumemiWeather.fetchWeather(request)
            let data = responseData.data(using: .utf8)!
            do {
                return try jsonDecode(data: data)
            } catch {
                throw error
            }
        } catch {
            throw WeatherError.apiError
        }
    }
    
    func jsonDecode(data: Data) throws -> Response {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            let response: Response = try decoder.decode(Response.self, from: data)
            return response
        } catch {
            throw WeatherError.decodeError
        }
    }
}
