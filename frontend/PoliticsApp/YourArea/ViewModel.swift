//
//  ViewModel.swift
//  PoliBytesOtherViews
//
//  Created by Ronald Jabouin on 12/2/22.
//

import Foundation

struct Representatives: Hashable, Codable {
    let id: Int
    let name: String
    let party: String
    let phone: String
    let website: String
    let office: String
    let title: String
    let state: String
}

class ViewModel: ObservableObject {
    
    @Published var representatives: [Representatives] = []
    @Published var passed: Bool = false
    
    func fetch(zip : String) async {
        guard let url = URL(string: "http://35.188.171.193/api/locations/\(zip)/") else {
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode([Representatives].self, from: data) {
                representatives = decodedResponse
                passed = true
            }
        } catch {
            passed = false
            print("something went wrong")
        }
    }
}
            
    
