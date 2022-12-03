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
    var overallscale:CGFloat = 0
    @State var currentScale: CGFloat = 0
    @State var finalScale: CGFloat = 1
    @State var CongressHouse = 0
    @GestureState var locationState = CGPoint(x: UIScreen.main.bounds.size.width/2, y: UIScreen.main.bounds.size.height/2)
    @State var location = CGPoint(x: UIScreen.main.bounds.size.width/2, y: UIScreen.main.bounds.size.height/2)
    @State var finalscale = 0
    @State var district: Int = 1
    @State var districtString = ""
    @State var state: String = "TX"
        let states = ["us2", "us", "usa-low", "alabama", "Tartan"]
    @State var file = "usa-low"
//    static var statesdic = ["AL": 7,"AK": 1,"AZ": 9,"AR": 4,"CA": 52,"CO": 8,"CT": 5,"DE": 1,"FL": 28,"GA": 14,"HI": 2,"ID": 2,"IL": 17,"IN": 9,"IA": 4,"KS": 4,"KY": 6,"LA": 6,"ME": 2,"MD": 8,"MA": 9,"MI": 13,"MN": 8,"MS": 4,"MO": 8,"MT": 2,"NE": 3,"NV": 4,"NH": 2,"NJ": 12,"NM": 3,"NY": 26,"NC": 14,"ND": 1,"OH": 15,"OK": 5,"OR": 6,"PA": 17,"RI": 2,"SC": 7,"SD": 1,"TN": 9,"TX": 38,"UT": 4,"VT": 1,"VA": 11,"WA": 10,"WV": 2,"WI": 8,"WY": 1]
//    var statesdic2 : [String : [Int]] = ["AL": [1, 2, 3, 4, 5, 6, 7], "AK": [1], "AZ": [1, 2, 3, 4, 5, 6, 7, 8, 9], "AR": [1, 2, 3, 4], "CA": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52], "CO": [1, 2, 3, 4, 5, 6, 7, 8], "CT": [1, 2, 3, 4, 5], "DE": [1], "FL": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28], "GA": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "HI": [1, 2], "ID": [1, 2], "IL": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17], "IN": [1, 2, 3, 4, 5, 6, 7, 8, 9], "IA": [1, 2, 3, 4], "KS": [1, 2, 3, 4], "KY": [1, 2, 3, 4, 5, 6], "LA": [1, 2, 3, 4, 5, 6], "ME": [1, 2], "MD": [1, 2, 3, 4, 5, 6, 7, 8], "MA": [1, 2, 3, 4, 5, 6, 7, 8, 9], "MI": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13], "MN": [1, 2, 3, 4, 5, 6, 7, 8], "MS": [1, 2, 3, 4], "MO": [1, 2, 3, 4, 5, 6, 7, 8], "MT": [1, 2], "NE": [1, 2, 3], "NV": [1, 2, 3, 4], "NH": [1, 2], "NJ": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "NM": [1, 2, 3], "NY": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26], "NC": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "ND": [1], "OH": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], "OK": [1, 2, 3, 4, 5], "OR": [1, 2, 3, 4, 5, 6], "PA": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17], "RI": [1, 2], "SC": [1, 2, 3, 4, 5, 6, 7], "SD": [1], "TN": [1, 2, 3, 4, 5, 6, 7, 8, 9], "TX": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38], "UT": [1, 2, 3, 4], "VT": [1], "VA": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "WA": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], "WV": [1, 2], "WI": [1, 2, 3, 4, 5, 6, 7, 8], "WY": [1]]

    
    var drag: some Gesture {
        DragGesture(
//            minimumDistance: 200,
            coordinateSpace: .local
        )
            .onChanged { value in
                self.location = value.location
            }
            .onEnded { value in
            }
            .updating(
                self.$locationState
            ) { currentState, pastLocation, transaction  in
                pastLocation = currentState.location
                transaction.animation = .easeInOut
            }
        }
    
    var body : some View {
        ZStack{
            VStack{
                InteractiveMap(svgName: file) { pathData in
                    InteractiveShape(pathData)
                        .stroke(clickedPath == pathData ? .cyan : .red, lineWidth: 1)
                        .shadow(color: clickedPath == pathData ? .cyan : .red,  radius: 3)
                        .shadow(color: clickedPath == pathData ? .cyan : .clear , radius: 3)
                        .background(InteractiveShape(pathData).fill(Color(white: 0.15)))
                        .shadow(color: clickedPath == pathData ? .black : .clear , radius: 5, y: 1)
                        .onTapGesture {
                            clickedPath = pathData
                            var statecode: String = String(pathData.id.suffix(2))
                            state = statecode
                        }
                        .zIndex(clickedPath == pathData ? 2 : 1)
                        .animation(.easeInOut(duration: 0.3), value: clickedPath)
                    
                }
                .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.width * (2/3 ))
                .scaleEffect(finalScale + currentScale)
                .position(location)
                .gesture(
                    MagnificationGesture()
                        .onChanged{ newScale in
                            if newScale >= 0.5{
                                currentScale = newScale

                            }else{
                                currentScale = currentScale
                            }
                        }
                        .onEnded{ scale in
                            finalScale = scale
                            currentScale = 0
                            if scale < 0.5{
                                finalScale = 0.8
                            }
                            if scale > 4.0{
                                finalScale = 4.0
                            }
                        }
                )
                .simultaneousGesture(drag)
            }
            VStack(spacing: 5){
                HStack{
                    Text("US Map")
                        .font(.system(size: 36, weight: .bold))
                        .padding(.horizontal, 20)
                    Spacer()
                }
                .padding(.top, 20)
                HStack{
                    Picker("What is your favorite color?", selection: $CongressHouse) {
                        Text("House").tag(0)
                        Text("Senate").tag(1)
                    }
                    .padding(.horizontal, 20)
                    .pickerStyle(.segmented)
                   TextField("Enter District", text: $districtString)
                        .background(.gray)
                        .cornerRadius(15)
                        .padding()
                        .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                }
                Spacer()
            }
        }

    }
}
