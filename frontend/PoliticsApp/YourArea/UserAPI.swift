//
//  UserAPI.swift
//  PoliticsApp
//
//  Created by Miranda Luo on 12/2/22.
//

import Foundation

struct UserInput: Codable {
    var name: String
    var password: String
    var location: String
}

struct UserLoginInput: Codable {
    var name: String
    var password: String
}

struct Location: Codable {
    let name: Int
    let zipCode: String
    let state: String
}

struct UserResponse: Codable {
    let id: Int
    let name: String
    let representatives: [Representatives]
    let location: Location
    let session_token: String
    let session_expiration: String
    let update_token: String
}

struct UserLoginResponse: Codable {
    let session_token: String
    let session_expiration: String
    let update_token: String
}

struct ErrorResponse: Codable {
    let error: String
}

class UserAPI: ObservableObject {
    
    @Published var userResponse: UserResponse?
    @Published var userLoginResponse: UserLoginResponse?
    @Published var errorResponse: String = ""
    
    func fetchUser(token: String) async {
        guard let url = URL(string: "http://35.188.171.193/api/user/all/") else {
            return
        }
        
        do {
            var request = URLRequest(url: url)
//            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            print(request.allHTTPHeaderFields)
            
            guard let encoded = try? JSONEncoder().encode(UserLoginInput(name: "", password: "")) else {
                print("Failed to encode user")
                return
            }

            request.httpMethod = "POST"
            
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            if let decodedResponse = try? JSONDecoder().decode(UserResponse.self, from: data) {
                errorResponse = ""
                userResponse = decodedResponse
            } else {
                print(data)
                if let decodedResponse = try? JSONDecoder().decode(ErrorResponse.self, from: data) {
                    errorResponse = decodedResponse.error
                } else {
                    errorResponse = "Something went wrong"
                }
                print("Failed to decode response")
            }
        } catch {
            print("Something went wrong")
        }
    }
    
    func login(name: String, password: String) async {
        guard let url = URL(string: "http://35.188.171.193/api/login/") else {
            return
        }
        
        do {
            var request = URLRequest(url: url)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"
            
            guard let encoded = try? JSONEncoder().encode(UserLoginInput(name: name, password: password)) else {
                print("Failed to encode user")
                return
            }
            
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            if let decodedResponse = try? JSONDecoder().decode(UserLoginResponse.self, from: data) {
                errorResponse = ""
                userLoginResponse = decodedResponse
            } else {
                if let decodedResponse = try? JSONDecoder().decode(ErrorResponse.self, from: data) {
                    errorResponse = decodedResponse.error
                }
                print("Failed to decode response")
            }
        } catch {
            print("Something went wrong")
        }
    }
    
    func register(name: String, password: String, location: String) async {
        guard let url = URL(string: "http://35.188.171.193/api/user/") else {
            return
        }
        
        do {
            var request = URLRequest(url: url)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"
            
            guard let encoded = try? JSONEncoder().encode(UserInput(name: name, password: password, location: location)) else {
                print("Failed to encode user")
                return
            }
            
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            if let decodedResponse = try? JSONDecoder().decode(UserResponse.self, from: data) {
                errorResponse = ""
                userResponse = decodedResponse
            } else {
                if let decodedResponse = try? JSONDecoder().decode(ErrorResponse.self, from: data) {
                    errorResponse = decodedResponse.error
                }
                print("Failed to decode response")
            }
        } catch {
            print("Something went wrong")
        }
    }
    
    func getRepresentatives() async {
        
    }

}
            
    
