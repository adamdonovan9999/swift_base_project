//
//  ViewController.swift
//  Base
//
//  Created by Van Do on 7/4/21.
//

import UIKit

class ViewController: BaseViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    testAPI()
  }
  
  private func testAPI() {
    StarshipService.searchStartships("co") { (data) in
      print(data)
    }
  }
}

