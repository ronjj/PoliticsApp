//
//  MapView.swift
//  PoliticsApp
//
//  Created by Jayson  Hahn on 11/20/22.
//

import SwiftUI

//struct MapView: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
import InteractiveMap

struct MapView : View {
    @State private var clickedPath = PathData()
    @State var currentScale: CGFloat = 0
    @State var finalScale: CGFloat = 1
    
    var body : some View {
        VStack{
            InteractiveMap(svgName: "usa-low") { pathData in
                InteractiveShape(pathData)
                    .stroke(clickedPath == pathData ? .indigo : .pink, lineWidth: 1)
                    .background(InteractiveShape(pathData).fill(Color(white: 0.1)))
                    .shadow(
                        color: clickedPath == pathData ? .indigo : .pink, radius: clickedPath == pathData ? 10 : 1
                    )
                    .onTapGesture {
                        clickedPath = pathData
                    }
            }
            .scaleEffect(finalScale + currentScale)
            .gesture(
                MagnificationGesture()
                    .onChanged{ newScale in
                        currentScale = newScale
                    }
                    .onEnded{ scale in
                        finalScale = scale
                        currentScale = 0
                    }
            )
        }
    }
}
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
