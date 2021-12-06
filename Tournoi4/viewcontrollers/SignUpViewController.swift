//
//  SignUpViewController.swift
//  tournoi
//
//  Created by Apple Esprit on 9/11/2021.
//
import Alamofire
import UIKit
import SwiftyJSON
class SignUpViewController: UIViewController {
    
    

    
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    @IBOutlet weak var signUpButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
        func validationField() -> String? {
            
            //Controlelr l'information est-il complet
            
            if
                usernameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
                emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
                passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
                
            
            {
               
                return " Il ne faut pas laisser certain information vide ."
                
                
            }
            
            //Controle saisie de Password
            let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            if Utilities.isPasswordValide(cleanedPassword) == false{
                
                return "Il faut doit étre au moins 8 caractére , un Symbole et un nombre ."
                
            }
            
            
            return nil
            
            
    }
    
    
    @IBAction func signUpTapped(_ sender: Any) {
        
       
        let username = usernameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        inscription().inscription(user: User(username: username, email: email, password: password)) { sucess in
            if sucess{
                print("saret")
            } else {
                print("masaretch")
            }
        }
    }
   
    
}
