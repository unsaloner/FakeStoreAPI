//
//  LoginViewController.swift
//  FakestoreProject
//
//  Created by Unsal Oner on 22.01.2023.
//

import UIKit
import Firebase
import Foundation

final class LoginViewController: UIViewController {
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordText.isSecureTextEntry = true
        
    }
    

    @IBAction func loginButtonClicked(_ sender: Any) {
        
        if emailText.text != "" && passwordText.text != "" {
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { auth, error in
                if error != nil {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                }else{
                    let homeViewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
                    homeViewController.modalPresentationStyle = .fullScreen
                    homeViewController.modalTransitionStyle = .flipHorizontal
                        self.present(homeViewController, animated: true, completion: nil)
                    
                    
                }
            }
            
        }else {
            self.makeAlert(title: "Error!", message: "Invalid email address or password!")
        }
        
    }
    
    func makeAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        self.present(alert, animated: true)
        alert.addAction(okButton)
        
        
    }

}
