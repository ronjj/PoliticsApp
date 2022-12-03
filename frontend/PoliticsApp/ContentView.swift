//
//  ContentView.swift
//  PoliticsApp
//
//  Created by Ronald Jabouin on 11/23/22.
//

import SwiftUI
import UIKit

struct ContentView: View {
   

    var body: some View {
        TabView{
            MapView()
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
            NewsTabView()
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
        .onAppear{
                let tabBarAppearance = UITabBarAppearance()
                tabBarAppearance.configureWithOpaqueBackground()
                UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            }
    }
}

