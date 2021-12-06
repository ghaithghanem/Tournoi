//
//  LoginViewController.swift
//  tournoi
//
//  Created by Apple Esprit on 9/11/2021.
//

import UIKit
import Alamofire
import SwiftyJSON
class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var usernameTextField: UITextField!
    

    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginBUtton: UIButton!
    
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
    
 }
    
    @IBAction func loginTapped(_ sender: Any) {
        
        let username = usernameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        inscription().connexion(user : User(username: username, password: password)) { sucess,user  in
            if sucess{
                self.performSegue(withIdentifier: "profileSegue", sender: IndexPath.self)
            } else {
                self.showAlert(title: "Failure", message: "invalid Credentials")
                print("masaretch")
           }
       }
    }
    func showAlert(title:String, message:String){
                  let alert = UIAlertController(title: title, message: message,preferredStyle: .alert)
                  let action = UIAlertAction(title:"ok", style: .cancel, handler:nil)
                  alert.addAction(action)
                  self.present(alert, animated: true, completion: nil)

}
}
