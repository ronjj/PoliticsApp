//
//  ReusableCategoryButton.swift
//  PoliticsApp
//
//  Created by Ronald Jabouin on 12/1/22.
//

import SwiftUI

struct ReusableCategoryButton: View {
    
    @ObservedObject var articlesNewsVM = ArticleNewsViewModel()

    let text: String
    let selection: Category
    var body: some View {
        Button {
            
            articlesNewsVM.fetchTaskToken.category = Category(rawValue: text.lowercased()) ?? Category.general
        } label : {
            Text(text)
        }
//        .padding()
        .buttonStyle(.bordered)
        .edgesIgnoringSafeArea(.horizontal)

    }
}


