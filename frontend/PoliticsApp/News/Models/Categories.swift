//
//  Categories.swift
//  PoliticsApp
//
//  Created by Ronald Jabouin on 11/24/22.
//

import Foundation

enum Category: String, CaseIterable {
    case general
    case business
    case technology
    case entertainment
    case sports
    case science
    case health
    case politics
    
    var text: String {
        if self == .general {
            return "Top Headline"
        }
        return rawValue.capitalized
    }
}

extension Category: Identifiable {
    var id: Self {self}
}
