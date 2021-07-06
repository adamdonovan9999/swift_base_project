//
//  BaseViewController.swift
//  Base
//
//  Created by Van Do on 7/5/21.
//

import UIKit

class BaseViewController: UIViewController {
  
  @IBOutlet internal weak var headerView: HeaderView?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupBaseUI()
  }
  
  // MARK: - UI
  
  public func setBackType(_ type: HeaderBackType) {
    if let headerView = headerView {
      headerView.setBackType(type)
      
      if headerView.backType == .Back {
        headerView.addTargetBack(self, action: #selector(backButtonTouch), for: .touchUpInside)
      } else if headerView.backType == .Close {
        headerView.addTargetBack(self, action: #selector(closeButtonTouch), for: .touchUpInside)
      }
    }
  }
  
  internal func setupBaseUI() {
    setupHeaderUI()
  }
  
  private func setupHeaderUI() {
    if let headerView = headerView {
      headerView.addTargetBack(self, action: #selector(backButtonTouch), for: .touchUpInside)
    }
  }
  
  // MARK: - IBAction
  
  @objc private func backButtonTouch() {
    navigationController?.popViewController(animated: true)
  }
  
  @objc private func closeButtonTouch() {
    dismiss(animated: true, completion: nil)
  }
  
}
