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

class UserAPI: ObservableObject {
    
    @Published var userResponse: UserResponse?
    
    func register(name: String, password: String, location: String) async {
        guard let url = URL(string: "http://35.188.171.193/api/user/") else {
            return
        }
        
        do {
            var request = URLRequest(url: url)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"
            
            guard let encoded = try? JSONEncoder().encode(UserInput(name: name, password: password, location: location)) else {
                print("Failed to encode order")
                return
            }
            
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            if let decodedResponse = try? JSONDecoder().decode(UserResponse.self, from: data) {
                userResponse = decodedResponse
            }
        } catch {
            print("Something went wrong")
        }
    }
    
//    func fetch(name: String, password: String, ) async {
//        guard let url = URL(string: "http://35.188.171.193/api/locations/\(zip)/") else {
//            return
//        }
//        
//        do {
//            let (data, _) = try await URLSession.shared.data(from: url)
//            
//            if let decodedResponse = try? JSONDecoder().decode([Representatives].self, from: data) {
//                representatives = decodedResponse
//            }
//        } catch {
//            print("something went wrong")
//        }
//    }
}
            
    
