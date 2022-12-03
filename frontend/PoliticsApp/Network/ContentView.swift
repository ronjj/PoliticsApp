//
//  ContentView.swift
//  PoliBytesOtherViews
//
//  Created by Ronald Jabouin on 12/2/22.
//

import SwiftUI


struct ContentView: View {
        @StateObject var viewModel = ViewModel()
        
        var body: some View {
            NavigationView{
                List{
                    ForEach(viewModel.representatives, id:\.self) { rep in
                        HStack{
                            Text(rep.name)
                            Text(rep.party)
                        }
                    }
                }
                .navigationTitle("Reps")
                .task {
                    await viewModel.fetch()
                    print(viewModel.representatives)
                }
            }
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
