//
//  Utility.swift
//  TeamsChat
//
//  Created by Urvesh Parmar on 12/12/22.
//

//
//  DBUtility.swift
//  Fasting App
//
//  Created by Capgemini_DA164 on 6/10/22.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth
import UIKit
import FirebaseStorage
import SwiftUI

struct Account : Codable {
    
    var email : String
    var name : String
    
    func toDict() -> [String : String] {
        return ["email" : email, "name" : name]
    }
}

class DBUtility{
    private init(){}
    static let instance = DBUtility()
    let dbRef = Database.database().reference()
    
    func saveUserDetails(email: String, name: String ) {
        
        let loggedInUser = Auth.auth().currentUser
        
        let uAccount = Account(email: email, name: name)
        
        if let user = loggedInUser {
            
            dbRef.child("Users").child(user.uid).setValue(uAccount.toDict())
        }
    }
    
    
    func getUserDetails(completionHandler: @escaping (Account) -> Void) {
        //get logged  in user
        let loggedInUser = Auth.auth().currentUser
        if let user = loggedInUser {
            //read from realtime db
            let uNode = dbRef.child("Users").child(user.uid)
            uNode.getData { err, snapshot in
                if err == nil {
                    //success
                    let info = snapshot?.value as! Dictionary<String, String>
                    
                    let email = info["email"] ?? ""
                    let name = info["name"] ?? ""
                   
                  
                    print("Email: \(email)")
                    let acc = Account(email: email, name: name)
                    completionHandler(acc)
                    
                }
            }
            
        }
    }
    
}


