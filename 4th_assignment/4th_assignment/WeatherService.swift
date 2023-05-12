//
//  WeatherService.swift
//  4th_assignment
//
//  Created by 신지원 on 2023/05/12.
//


import Foundation
import Alamofire

final class WeatherService {
    let baseURL = "https://api.openweathermap.org/data/2.5/weather?"
    static let shared = WeatherService()
    
    private init() {}
    
    func getWeather(city : String, completion : @escaping (NetworkResult<Any>) -> Void) {
        let url = "https://api.openweathermap.org/data/2.5/weather"
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        let body: Parameters = [
            "q": city,
            "appid": "9c7fa18b50b00954d1159672fb66a924",
        ]
        
        let dataRequest = AF.request(url, method: .get,
                                     parameters : body,
                                     headers: header)

        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
            case .failure:
                completion(.networkErr)
            }
        }
    }
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isValidData(data: data)
        case 400...409: return isValidData(data: data)
        case 500: return .serverErr
        default: return .networkErr
        }
    }
    
    private func isValidData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(Weathers.self, from: data) else { return .pathErr }
        
        return .success(decodedData as Any)
    }
}

