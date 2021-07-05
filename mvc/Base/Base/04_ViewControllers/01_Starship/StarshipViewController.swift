//
//  StarshipViewController.swift
//  Base
//
//  Created by Van Do on 7/5/21.
//

import UIKit

class StarshipViewController: BaseViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
    testAPI()
  }
  
  // MARK: - UI
  
  private func setupUI() {
    
  }
  
  // MARK: IBAction
  
  @IBAction func gotoDetailButtonTouch(_ sender: UIButton) {
    if let controller = UIStoryboard.loadStarshipDetailController() as? StarshipDetailViewController {
      self.navigationController?.pushViewController(controller, animated: true)
    }
  }
  
  @IBAction func presentDetailButtonTouch(_ sender: UIButton) {
    if let controller = UIStoryboard.loadStarshipPopupViewController() as? StarshipPopupViewController {
      present(controller, animated: true, completion: nil)
    }
  }
  
  // MARK: Data
  
  private func testAPI() {
    StarshipService.searchStartships("co") { (data) in
      print(data)
    }
  }
  
}
