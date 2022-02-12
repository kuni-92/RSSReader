//
//  SafariView.swift
//  RSSReader
//  
//  Created by kunikuni03 on 2022/02/10
//  
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    @Binding var url: String
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        let safariViewController = SFSafariViewController(url: URL(string: url)!)
        safariViewController.dismissButtonStyle = .close
        return safariViewController
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {
        
    }
}
