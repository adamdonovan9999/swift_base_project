//
//  Starship.swift
//  Base
//
//  Created by Van Do on 7/4/21.
//

import ObjectMapper

class Starship: BaseModel {
  var name: String = ""
  var model: String = ""
  var manufacturer: String = ""
  
  override func mapping(map: Map) {
    name <- map["name"]
    model <- map["model"]
    manufacturer <- map["manufacturer"]
  }
}
