//
//  BaseService.swift
//  Base
//
//  Created by Van Do on 7/5/21.
//

import Alamofire
import SwiftyJSON

let BASE_URL = "https://swapi.dev/api/"

enum ServiceError: Error, Equatable {
  case none
  case requestError(message: String)
  case serverError(message: String)
  
  var message: String {
    switch  self {
    case .requestError(let message):
      return message
    case .serverError(let message):
      return message
    default:
      return (self as NSError).localizedDescription
    }
  }
}

class BaseService {
  
  class func request(_ method: HTTPMethod, path: String, parameters: [String: Any], completion: @escaping (JSON?, ServiceError) -> Void) {
    let fullPath = "\(BASE_URL)\(path)"
    
    if let url = URL(string: fullPath) {
      var urlRequest = URLRequest(url: url)
      urlRequest.httpMethod = method.rawValue
      
      urlRequest.addValue("Token 1234567890", forHTTPHeaderField: "Authorization")
      urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
      
      AF.request(urlRequest).responseJSON { response in
        var result: (response: JSON?, error: ServiceError) = (nil, .none)
        
        switch response.result {
          case .success(_):
            if let responseCode = response.response?.statusCode {
              switch responseCode {
                case 200, 204:
                  result.error = .none
                case 401:
                  result.error = .requestError(message: "Authentication credentials is incorrect.")
                case 403:
                  result.error = .requestError(message: "The requested URL is forbidden.")
                case 404:
                  result.error = .requestError(message: "The requested URL doesn't exist.")
                default:
                  result.error = .serverError(message: "Something went wrong.")
              }
            }
            
            do {
              if let json = response.data {
                result.response = try JSON(data: json)
                completion(result.response, result.error)
              }
            } catch let error as NSError {
              result.error = .requestError(message: error.localizedDescription)
              completion(nil, result.error)
            }
            
          case .failure(let error):
            result.error = .requestError(message: error.localizedDescription)
            completion(nil, result.error)
        }
      }
    }
    
    
    /*
    AF.request(path, parameters: parameters).validate().responseJSON { (response) in
      var result: (response: JSON?, error: ServiceError) = (nil, .none)
      
      switch response.result {
        case .success(_):
          if let responseCode = response.response?.statusCode {
            switch responseCode {
              case 200, 204:
                result.error = .none
              case 401:
                result.error = .requestError(message: "Authentication credentials is incorrect.")
              case 403:
                result.error = .requestError(message: "The requested URL is forbidden.")
              case 404:
                result.error = .requestError(message: "The requested URL doesn't exist.")
              default:
                result.error = .serverError(message: "Something went wrong.")
            }
          }
          
          do {
            if let json = response.data {
              result.response = try JSON(data: json)
              completion(result.response, result.error)
            }
          } catch let error as NSError {
            result.error = .requestError(message: error.localizedDescription)
            completion(nil, result.error)
          }
          
        case .failure(let error):
          result.error = .requestError(message: error.localizedDescription)
          completion(nil, result.error)
      }
      
    }
    */
    
  }
  
}
