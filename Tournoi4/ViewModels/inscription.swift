//
//  inscription.swift
//  Tournoi4
//
//  Created by Mac2021 on 2/12/2021.
//
import Alamofire
import SwiftyJSON
import UIKit

class inscription:  ObservableObject{
    init(){}
        
        func inscription(user: User, completed: @escaping (Bool) -> Void) {
            AF.request("http://172.17.0.91:3000/api/auth/signup",
                       method: .post,
                       parameters: [
                        "username": user.username!,
                        "email": user.email!,
                        "password": user.password!,
                       
                       ])
                .validate(statusCode: 200..<300)
                .validate(contentType: ["application/json"])
                .responseData { response in
                    switch response.result {
                    case .success:
                        print("Validation Successful")
                        completed(true)
                    case let .failure(error):
                        print(error)
                        completed(false)
                    }
                }
        }
    func connexion(user: User, completed: @escaping (Bool, Any?) -> Void) {
            AF.request("http://172.17.0.91:3000/api/auth/signin",
                       method: .post,
                       parameters: ["username": user.username, "password": user.password])
                .validate(statusCode: 200..<300)
                .validate(contentType: ["application/json"])
                .responseData { response in
                    switch response.result {
                    case .success:
                        let jsonData = JSON(response.data!)
                        let user = self.makeItem(jsonItem: jsonData["user"])
                        UserDefaults.standard.setValue(jsonData["token"].stringValue, forKey: "userToken")
                        print(user)
                        
                        completed(true, user)
                    case let .failure(error):
                        debugPrint(error)
                        completed(false, nil)
                    }
                }
        }
    func makeItem(jsonItem: JSON) -> User{
            //let isoDate = jsonItem["dateNaissance"]
           
            return User(
                username:jsonItem["username"].stringValue,
                email: jsonItem["email"].stringValue,
                password: jsonItem["password"].stringValue,
                _id: jsonItem["_id"].stringValue
              
               
               
              
            )
        }
        
    }

