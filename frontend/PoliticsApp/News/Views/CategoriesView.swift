//
//  CategoriesView.swift
//  PoliticsApp
//
//  Created by Ronald Jabouin on 11/24/22.
//

import SwiftUI

struct CategoriesView: View {
    
    @ObservedObject var articlesNewsVM = ArticleNewsViewModel()

    var body: some View {
        
//
//        Picker(selection: $articlesNewsVM.fetchTaskToken.category, label: EmptyView()) {
//            ForEach(Category.allCases){
//                Text($0.text).tag($0)
//            }
//        }
//        .pickerStyle(.menu)
        
        ScrollView(.horizontal) {
            HStack{
                ForEach(Category.allCases){
                    CategoriesRowCell(bodyText: $0.text).tag($0)
                   // Text($0.text).tag($0)
                }
            }
        }
        .scrollIndicators(.hidden)
        .padding()
        .edgesIgnoringSafeArea(.horizontal)

    }
    
}

struct CategoriesRowCell: View {

    let bodyText: String
    @ObservedObject var articlesNewsVM = ArticleNewsViewModel()


    var body: some View{
        Button {
       
        } label: {
            Text(bodyText)
        }
        .buttonStyle(.bordered)
        .buttonBorderShape(.roundedRectangle)

    }
}
