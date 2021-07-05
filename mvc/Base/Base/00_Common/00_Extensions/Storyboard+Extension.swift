//
//  Storyboard+Extension.swift
//  Base
//
//  Created by Van Do on 7/5/21.
//

import UIKit

fileprivate enum Storyboard : String {
  case main = "Main"
  case starship = "Starship"
}

fileprivate extension UIStoryboard {
  
  static func load(from storyboard: Storyboard, identifier: String) -> UIViewController {
    let uiStoryboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
    return uiStoryboard.instantiateViewController(withIdentifier: identifier)
  }
  
  static func loadFromMain(_ identifier: String) -> UIViewController {
    return load(from: .main, identifier: identifier)
  }
  
  static func loadFromStarship(_ identifier: String) -> UIViewController {
    return load(from: .starship, identifier: identifier)
  }
  
}

extension UIStoryboard {
  
  class func loadStarshipController() -> UIViewController {
    return loadFromStarship("StarshipViewController")
  }
  
  class func loadStarshipDetailController() -> UIViewController {
    return loadFromStarship("StarshipDetailViewController")
  }
  
  class func loadStarshipPopupViewController() -> UIViewController {
    return loadFromStarship("StarshipPopupViewController")
  }
  
}

