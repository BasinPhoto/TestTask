//
//  WebView.swift
//  TestTask
//
//  Created by Sergey Basin on 29.03.2021.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    let url: URL?
    
    func makeUIView(context: Context) -> WKWebView {
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences = prefs
        let webView = WKWebView(frame: .zero, configuration: config)
        
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let url = self.url else {
            return
        }
        
        let request = URLRequest(url: url)
        uiView.load(request)
    }
    
}
