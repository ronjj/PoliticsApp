//
//  ContentView.swift
//  PoliticsApp
//
//  Created by Ronald Jabouin on 11/23/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            replace1()
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
            NewsView()
                .tabItem{
                    Image(systemName: "newspaper")
                    Text("News")
                }
            WrappedYourAreaView()
                .tabItem {
                    Image(systemName: "mappin")
                    Text("Your Area")
                }
        }
    }
}

