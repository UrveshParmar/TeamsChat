//
//  LoginViewController.swift
//  TeamsChat
//
//  Created by Urvesh Parmar on 07/12/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var Login: UITextField!
    
    
    @IBOutlet weak var Pass: UITextField!
    
    
    @IBOutlet weak var LoginBTN: UIButton!
    
    @IBOutlet weak var registerbTN: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let uname = Login.text ?? ""
        let password = Pass.text ?? ""
        
        
        /* Auth.auth().signIn(withEmail: uname, password: password) { result, err in
         
         if err == nil{
         
         let vc = self.storyboard?.instantiateViewController(withIdentifier: "tabBar") as! UITabBarController
         self.show(vc, sender: nil)
         }
         else{
         self.showAlert(title: "Login failed..", msg: err!.localizedDescription)            }
         }
         
         }
         
         @IBAction func cancelClick(_ sender: Any) {
         //navigationController?.popViewController(animated: false)
         Login.text = ""
         Pass.text = ""
         
         
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
         
         */
        
    }
    
}
