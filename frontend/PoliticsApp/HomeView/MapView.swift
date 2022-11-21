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

struct MapView: View {
    @State private var clickedPath = PathData()
    var body: some View {
        VStack {
            Text(clickedPath.name.isEmpty ? "" : "\(clickedPath.name) is clicked!" )
                .font(.largeTitle)
                .padding(.bottom, 15)

            InteractiveMap(svgName: "tr") { pathData in // is a PathData
                InteractiveShape(pathData)
                    .stroke(clickedPath == pathData ? .cyan : .red, lineWidth: 1)
                    .shadow(color: clickedPath == pathData ? .cyan : .red,  radius: 3)
                    .shadow(color: clickedPath == pathData ? .cyan : .clear , radius: 3) // to increase the glow amount
                    .background(InteractiveShape(pathData).fill(Color(white: 0.15))) // filling the shapes
                    .shadow(color: clickedPath == pathData ? .black : .clear , radius: 5, y: 1) // for depth

                    .onTapGesture {
                        clickedPath = pathData
                    }
                    .zIndex(clickedPath == pathData ? 2 : 1) // this is REQUIRED because InteractiveShapes overlap, resulting in an ugly appearance
                    .animation(.easeInOut(duration: 0.3), value: clickedPath)
            }
        }
    }
}
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
