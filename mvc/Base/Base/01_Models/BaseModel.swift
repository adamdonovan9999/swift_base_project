//
//  BaseModel.swift
//  Base
//
//  Created by Van Do on 7/4/21.
//

import ObjectMapper

class BaseModel: NSObject, Mappable {
  
  override init() {
    super.init()
  }
  
  required convenience init?(map: Map) {
    self.init()
  }
  
  func mapping(map: Map) {
    
  }
  

}
