//
//  StarshipService.swift
//  Base
//
//  Created by Van Do on 7/4/21.
//

import ObjectMapper

let STAR_SHIP = "starships"

class StarshipService {
  
  class func searchStartships(_ name: String, completion: @escaping ([Starship]) -> Void) {
    let path = STAR_SHIP
    let parameters: [String: String] = ["search": name]
    
    BaseService.request(.get, path: path, parameters: parameters) { (response, error) in
      if let response = response {
        let results = response["results"]
        if let data = Mapper<Starship>().mapArray(JSONObject: results.rawValue) {
          completion(data)
        } else {
          completion([])
        }
      }
    }
  }
  
}
