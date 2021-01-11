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
        let username = usernameTextField.text
        let password = passwordTextField.text
        do{
            try 
        }
        
        
    }
    
    @IBAction func dontHaveAccountAction(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "Registration") as! SignUpViewController
        newViewController.modalPresentationStyle = .fullScreen
        present(newViewController, animated: true, completion: nil)
    }
    
}
extension SignInViewController{
    func switchVC(role: Role){
        if(role == .admin){
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "Admin") as! AdminViewController
            newViewController.modalPresentationStyle = .fullScreen
            present(newViewController, animated: true, completion: nil)
        }
        else{
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "RegularUser") as! RegularUserViewController
            newViewController.modalPresentationStyle = .fullScreen
            present(newViewController, animated: true, completion: nil)
        }
    }
}
