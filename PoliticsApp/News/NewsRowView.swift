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
        
        ZStack {
            Color.testBG.edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(news.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                Text(news.shortDesc)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
            }
            .padding()
        }
        .frame(minWidth: 360, maxWidth: 720, minHeight: 200, maxHeight: 400)
        .cornerRadius(20)
        //.shadow(color: .bg, radius: 30, x: 0, y: 15)
        .padding(5)
    }
}



