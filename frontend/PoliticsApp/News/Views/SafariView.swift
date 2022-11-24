//
//  SafariView.swift
//  PoliticsApp
//
//  Created by Ronald Jabouin on 11/24/22.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    
    let url: URL
    
    func makeUIViewController(context: Context) -> some SFSafariViewController {
        SFSafariViewController(url: url)
        
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
