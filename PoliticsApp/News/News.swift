//
//  News.swift
//  PoliticsApp
//
//  Created by Ronald Jabouin on 11/18/22.
//

import SwiftUI

struct News: Identifiable {
    //TODO: Restructure to be based on the JSON response
    var id = UUID()
    var headline: String
    var shortDesc: String
    var articleContents: String
}

extension News {
    static let dummyData: [News] = [
        
        canada, twitter, ftx
        

    ]
    
    private static let canada = News(headline: "Canada October producer prices up 2.4% on petroleum products", shortDesc: "Nov 18 (Reuters) - Producer prices in Canada rose by 2.4% in October from September on higher prices for refined petroleum energy products, Statistics Canada said on Friday. The depreciating Canadian dollar continued to affect prices.", articleContents: "lorem ipsum delorum. ipsum delorum,  ipsum delorum")

    private static let twitter = News(headline: "After Elon Musk's ultimatum, Twitter employees start exiting", shortDesc: "Hundreds of Twitter Inc employees are estimated to have decided to quit the beleaguered social media company following a Thursday deadline from new owner Elon Musk that staffers sign up... , " , articleContents: "lorem ipsum delorum")

    private static let ftx = News(headline: "EXCLUSIVE How FTX bought its way to become the 'most regulated' crypto exchange", shortDesc: "Before it collapsed this month, FTX stood apart from many rivals in the largely unsupervised crypto industry by boasting it was the 'most regulated' exchange on the planet and inviting closer scrutiny from authorities.", articleContents: "lorem ipsum delorum")
}




