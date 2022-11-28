//
//  EmptyPlaceholderView.swift
//  PoliticsApp
//
//  Created by Ronald Jabouin on 11/24/22.
//

import SwiftUI

struct EmptyPlaceholderView: View {
    let text: String
    let image: Image?
    
    var body: some View {
        VStack(spacing: 8) {
            Spacer()
            if let image = self.image {
                image
                    .imageScale(.large)
                    .font(.system(size: 52))
            }
            Text(text)
            Spacer()
        }
    }
}
