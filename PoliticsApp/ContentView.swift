//
//  ContentView.swift
//  PoliticsApp
//
//  Created by Ronald Jabouin on 11/18/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        //TODO: When page is selected, show filled version of icon
            //Ex: newspaper becomes newspaper.fill when selected
        
        TabView{
            replace2()
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
            
            NewsView()
                .tabItem{
                    Image(systemName: "newspaper")
                    Text("News")
                }
            
            replace1()
                .tabItem{
                    Image(systemName: "map")
                    Text("Your Area")
                }
            
        }
        // can also add an accent color later with
        //.accentColor(.color)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
