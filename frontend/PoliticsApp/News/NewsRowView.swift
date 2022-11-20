//
//  NewsRowView.swift
//  PoliticsApp
//
//  Created by Ronald Jabouin on 11/18/22.
//

import SwiftUI

struct NewsRowView: View {
    @Binding var news: News
    
    var body: some View {
        
            VStack(alignment: .leading, spacing: 10) {
                Text(news.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                Text(news.shortDesc)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                
                Text("Click To Read More >")
                    .font(.caption2)
                    
            }
            .padding()
        
    }
}



