//
//  SignInViewController.swift
//  BettingSystem
//
//  Created by Admin on 1/5/21.
//

import UIKit

class SignInViewController: UIViewController {
    
    @IBOutlet weak var dontHaveAccount: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func signInAction(_ sender: UIButton) {
          let VC = MakeBetViewController()
          VC.currentSystemUser = RegularUser(username: "New", password: "New", state: .authorized)
    }
    
    @IBAction func dontHaveAccountAction(_ sender: UIButton) {
    }
    
}
