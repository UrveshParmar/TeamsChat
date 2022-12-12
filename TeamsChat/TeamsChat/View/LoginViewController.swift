//
//  LoginViewController.swift
//  TeamsChat
//
//  Created by Urvesh Parmar on 07/12/22.
//

import UIKit
import FirebaseAuth
import Firebase
import SwiftUI

class LoginViewController: UIViewController {
    
    @IBOutlet weak var Login: UITextField!
    
    
    @IBOutlet weak var Pass: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Login.becomeFirstResponder()
    }
        
    
        
    @IBAction func loginBtn(_ sender: Any) {
        
        
        let uname = Login.text ?? ""
        let password = Pass.text ?? ""
        Auth.auth().signIn(withEmail: uname, password: password) {
            result, err in
            if err == nil {
                print("Login Successful")
                
            }
            
            else {
                //failed
                self.showAlert("Login Failed..")
                print("failed")
            }
        }
    }
        
        
    @IBAction func registerBtn(_ sender: Any) {
        let control = storyboard?.instantiateViewController(identifier: "RegisterViewController")  as! RegisterViewController
        control.modalPresentationStyle = .fullScreen
        control.modalTransitionStyle = .flipHorizontal
        present(control, animated: true, completion: nil)
        
    }
}
    
    
         extension LoginViewController: UITextFieldDelegate {
         
         
         func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         
         switch textField {
         case Login :
         Pass.becomeFirstResponder()
         default:
         textField.resignFirstResponder()
         }
         
         return true
         }
         
        
        
    }
    

