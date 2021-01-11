//
//  SignUpViewController.swift
//  BettingSystem
//
//  Created by Admin on 1/5/21.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var selectProfilePhotoButton: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userTypeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var alreadyHaveAccountButton: UIButton!
    let registration = Registration()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextFields()
        configureTapGesture()
    }
    
    @IBAction func selectProfilePhotoAction(_ sender: UIButton) {
    }
    
    @IBAction func signUpAction(_ sender: UIButton) {
    view.endEditing(true)
    guard let username = usernameTextField.text else {
        createAlert(title: "Username Error", message: "You must write something")
        return
    }
    guard let password = passwordTextField.text else {
        createAlert(title: "Password Error", message: "You must write something")
        return
    }
                
    let role: Role
    if userTypeSegmentedControl.selectedSegmentIndex == 0 {
        role = .regular
    } else {
        role = .admin
    }
    do {
        try registration.registerNewUser(username: username, password: password, role: role)
    } catch RegistrationError.passwordCount {
        createAlert(title: "Username Count Erorr", message: "Username must contain from 1 to 20 characters")
    } catch RegistrationError.usernameCount {
        createAlert(title: "Password Erorr", message: "Password must contain from 8 to 20 characters")
    } catch RegistrationError.userExists {
        createAlert(title: "Registration Erorr", message: "User with this nickname already exists")
    } catch {
    }
        createAlert(title: "Registration", message: "Registration completed successfully")
    }
    
    @IBAction func alreadyHaveAccountAction(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "SignIn") as! SignInViewController
        newViewController.modalPresentationStyle = .fullScreen
        present(newViewController, animated: true, completion: nil)
    }
    private func configureTextFields() {
            usernameTextField.delegate = self
            passwordTextField.delegate = self
        }
    
    private func configureTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(SignUpViewController.handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    @objc func handleTap() {
        view.endEditing(true)
    }
    
}
//MARK: Alert
extension SignUpViewController {
    private func createAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        
    }
}

//MARK: TextFieldDelegate
extension SignUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
