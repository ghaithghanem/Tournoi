//
//  ViewController.swift
//  tournoi
//
//  Created by Apple Esprit on 9/11/2021.
//

import UIKit
import GoogleSignIn
import FBSDKLoginKit

class ViewController: UIViewController{
   

    
    
  
   
    let googleSignInConfig = GIDConfiguration.init(clientID: "1086496714307-na9f2car63c3il7188uidn0pravdbbkd.apps.googleusercontent.com")
              var googleButton = GIDSignInButton()
    
    
    @IBOutlet weak var btnFacebook: FBLoginButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var stackViewGoogle: UIStackView!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let token = AccessToken.current, !token.isExpired { // User is logged in, do work such as go to next view controller.
            let token = token.tokenString
            
            let request = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["fields": "id, email, name, first_name, last_name, picture, short_name , name, middle_name, name_format, age_range"], tokenString: token, version: nil, httpMethod: .get)
            request.start {(connection,result, error) in
                print("\(result)")
                
            }
            
        }else{
            
            btnFacebook.permissions = ["public_profile", "email"]
            btnFacebook.delegate = self
        
        }
        // Do any additional setup after loading the view.
       
        stackViewGoogle.addSubview(googleButton)
        googleButton.addTarget(self, action: #selector(googleSignIn), for: .touchUpInside)
    }
    
    
    @objc func googleSignIn() {
           
           GIDSignIn.sharedInstance.signIn(with: googleSignInConfig, presenting: self) { [self] user, error in
               guard error == nil else { return }
               guard let user = user else { return }
               
               let email = user.profile?.email
               let name = (user.profile?.givenName)! + " " + (user.profile?.familyName)!
               
               loginWithSocialMedia(email: email, name: name, socialMediaName: "Google")
               
           }
       }
       
       func loginWithSocialMedia(email: String?, name: String?,
                                 socialMediaName: String) {
           
           
           
       }
       

}
extension ViewController: LoginButtonDelegate{
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("Logout")
    }
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        let token = result?.token?.tokenString
        
        let request = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["fields": "id, email, name, first_name, last_name, picture, short_name , name, middle_name, name_format, age_range"], tokenString: token, version: nil, httpMethod: .get)
        request.start {(connection,result, error) in
            print("\(result)")
            
        }
    }
    
    
}

