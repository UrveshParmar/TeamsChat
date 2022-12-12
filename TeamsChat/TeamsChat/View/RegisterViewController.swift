//
//  RegisterViewController.swift
//  TeamsChat
//
//  Created by Urvesh Parmar on 12/12/22.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var usernameTxt: UITextField!
    
    @IBOutlet weak var emailTxt: UITextField!
    
    @IBOutlet weak var passwordTxt: UITextField!
    
    @IBOutlet weak var conPasswordTxt: UITextField!
    
    var isValidCredentials = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func submitBtn(_ sender: Any) {
        let username = usernameTxt.text ?? ""
        let email = emailTxt.text ?? ""
        let password = passwordTxt.text ?? ""
        let conformpassword = conPasswordTxt.text ?? ""
        
        
        Auth.auth().createUser(withEmail: email, password: password) { result, err in
            
            if err == nil{
                
                print("NO ERROR IN REGISTERATION")
                self.showAlert("Registeration Successful")
                
                DBUtility.instance.saveUserDetails(email: email, name: username)
                print("data saved.")
                
            }else{
                self.showAlert("Registeration failed")
                
            }
        }
    }
}
            
            extension RegisterViewController: UITextFieldDelegate {
                
                func textFieldShouldReturn(_ textField: UITextField) -> Bool {
                    
                    switch textField {
                    case usernameTxt :
                        usernameTxt.becomeFirstResponder()
                    case usernameTxt :
                        passwordTxt.becomeFirstResponder()
                    case passwordTxt:
                        conPasswordTxt.becomeFirstResponder()
                    default:
                        textField.resignFirstResponder()
                    }
                    
                    return true
                }
                
                
                func textFieldDidEndEditing(_ textField: UITextField) {
                    
                    let data = textField.text ?? ""
                    
                    switch textField {
                    case usernameTxt :
                        isValidCredentials = validateName(name: data)
                    case emailTxt:
                        isValidCredentials = validateEmail(email: data)
                    case passwordTxt :
                        isValidCredentials = validatePassword(password: data)
                    case conPasswordTxt :
                        isValidCredentials = validateBothPasswords(conPassword: data)
                    default:
                        break
                    }
                    
                }
                
                func validateBothPasswords(conPassword: String) -> Bool {
                    let firstPass = passwordTxt.text ?? ""
                    
                    return conPassword == firstPass ? true : false
                }
                
                func validatePassword(password: String) -> Bool {
                    return password.count >= 6 ? true : false
                    
                }
                
                func validateEmail(email: String) -> Bool {
                    if !email.isEmpty && email.contains("@") {
                        return true
                    }
                    
                    return false
                }
                
                func validateName(name: String) -> Bool{
                    if name.count > 6 || name.contains(" "){
                        return true
                    }
                    else {
                        return false
                    }
                }
                
                
                
            }
            
            
            
            
        


