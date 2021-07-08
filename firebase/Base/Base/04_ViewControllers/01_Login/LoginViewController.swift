//
//  LoginViewController.swift
//  Base
//
//  Created by Van Do on 7/9/21.
//

import UIKit
import Firebase

class LoginViewController: BaseViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
  }
  
  // MARK: - UI
  
  private func setupUI() {
    
  }
  
  // MARK: IBAction
  
  @IBAction func signinButtonTouch(_ sender: UIButton) {
    let email = "adamdonovan@gmail.com"
    let password = "adamdonovan"
    
    Auth.auth().signIn(withEmail: email, password: password) { user, error in
      if let error = error, user == nil {
        let alert = UIAlertController(title: "Sign In Failed",
                                      message: error.localizedDescription,
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true, completion: nil)
      } else {
        if let controller = UIStoryboard.loadStarshipController() as? StarshipViewController {
          self.navigationController?.pushViewController(controller, animated: true)
        }
      }
    }
  }
  
  @IBAction func signupButtonTouch(_ sender: UIButton) {
    let alert = UIAlertController(title: "Register",
                                  message: "Register",
                                  preferredStyle: .alert)
    
    let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
      
      let emailField = alert.textFields![0]
      let passwordField = alert.textFields![1]
      
      Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!) { user, error in
        if let error = error {
          let alert = UIAlertController(title: "Sign Up Failed",
                                        message: error.localizedDescription,
                                        preferredStyle: .alert)
          
          alert.addAction(UIAlertAction(title: "OK", style: .default))
          
          self.present(alert, animated: true, completion: nil)
        } else {
          Auth.auth().signIn(withEmail: emailField.text!,
                             password: passwordField.text!)
        }
      }
    }
    
    let cancelAction = UIAlertAction(title: "Cancel",
                                     style: .cancel)
    
    alert.addTextField { textEmail in
      textEmail.placeholder = "Enter your email"
    }
    
    alert.addTextField { textPassword in
      textPassword.isSecureTextEntry = true
      textPassword.placeholder = "Enter your password"
    }
    
    alert.addAction(saveAction)
    alert.addAction(cancelAction)
    
    present(alert, animated: true, completion: nil)
  }
  
  // MARK: Data
  
  private func testAPI() {
    
  }
  
}
