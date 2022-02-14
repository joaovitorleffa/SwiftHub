//
//  WebView.swift
//  SwiftHub
//
//  Created by joaovitor on 14/02/22.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    let url: URL?
    
    func makeUIView(context: Context) -> some WKWebView {
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences = prefs
        
        return WKWebView(frame: .zero, configuration: config)
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        guard let myUrl = url else { return }
        let request = URLRequest(url: myUrl)
        uiView.load(request)
    }
    
}
