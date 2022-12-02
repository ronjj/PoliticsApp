//
//  OnboardingView.swift
//  PoliticsApp
//
//  Created by Ronald Jabouin on 12/1/22.
//

import SwiftUI

struct OnboardingView: View {
    
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Text("Welcome!")
                    .font(.title)
                Spacer()
            }
                    ZipcodeView()
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
