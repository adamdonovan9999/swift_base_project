//
//  StarshipPopupViewController.swift
//  Base
//
//  Created by Van Do on 7/5/21.
//

import UIKit

class StarshipPopupViewController: BaseViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
  }
  
  // MARK: - UI
  
  private func setupUI() {
    setBackType(.Close)
  }
  
}
