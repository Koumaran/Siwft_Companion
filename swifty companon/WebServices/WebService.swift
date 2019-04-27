//
//  WebService.swift
//  swifty companon
//
//  Created by Jegathas Sivanesan on 03/08/2018.
//  Copyright © 2018 Jegathas Sivanesan. All rights reserved.
//

import Foundation

struct TokenBox: Decodable {
    let accessToken: String?
    let expiresIn: Int?
    let tokenType: String?
    var getTime: Date?
}

struct User: Decodable {
    let id: Int
    let login: String
    let url: String
}

class WebService {
    let apiUId = "c049fca0270c61332ec27414a8d2f4962aec7b951fab6e80f9d5c689f946597e"
    let apiSecret = "fda04fe549906ec69b4cbd60f88c760d2122a8c5e7878ece66419e7819490137"
    var token: TokenBox?
    var timer: Timer!
    
    
    init() {
        getToken()
    }
    
    func getToken() {
        let api42: String = "https://api.intra.42.fr/oauth/token?"
        let params = "grant_type=client_credentials&client_id=\(apiUId)&client_secret=\(apiSecret)"
        
        guard let url = URL(string: "\(api42)\(params)") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        URLSession.shared.dataTask(with: request) { (data, response, err) in
            if let err = err {
                // modifier par une alert
                print(err)
            }

            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                self.token = try decoder.decode(TokenBox.self, from: data)
                self.token?.getTime = Date()
                print(self.token?.accessToken ?? "Empty Token")
            } catch let jsonErr {
                // modifier par une alert
                print("Failed to decode: ", jsonErr)
            }
        }.resume()
    }
    
    func getUser(text: String, completion: @escaping ([User], Error?) -> Void) {
        var result: [User] = []
        guard let token = token else {
            self.getToken()
            return
        }
        let api42: String = "https://api.intra.42.fr/v2/users?access_token=\(token.accessToken!)&range[login]=\(text.lowercased()),\(text.lowercased())z&sort=login"
			print("api42: \(api42)")
        guard let url = URL(string: api42) else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print(error!)
                return
            }
            do {
                result = try JSONDecoder().decode([User].self, from: data)
                completion(result, nil)
            } catch let jsonErr {
                print("Failed to decode: ", jsonErr)
            }
        }.resume()
    }
    
    func getProfile(url: String, completion: @escaping (Profile?, Error?) -> Void) {
        guard let token = token else {
            self.getToken()
            return
        }
        if let url = URL(string: "\(url)?access_token=\(token.accessToken!)") {
					print("ProfileUrl : \(url.absoluteString)")
            URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data , error == nil else {
                    completion(nil, error)
                    return
                }
                do {
                    let profile: Profile = try JSONDecoder().decode(Profile.self, from: data)
//                    print(profile)
                    completion(profile, nil)
                } catch let jsonErr {
                    completion(nil, jsonErr)
                }
            }.resume()
        }
    }
    
    
    // mettre en place pour notification center et gerer avec l'auto cehck du token
    func checkTokenValidity() {
        if let token = token, let expireTime = token.expiresIn {
            let now = Date()
            let time = token.getTime?.addingTimeInterval(TimeInterval(exactly: expireTime)!)
            if now > time! {
                getToken()
            }
        } else {
            getToken()
        }
    }
}
