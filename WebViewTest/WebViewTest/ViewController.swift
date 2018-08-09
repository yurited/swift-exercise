//
//  ViewController.swift
//  WebViewTest
//
//  Created by Li Yu on 8/7/18.
//  Copyright © 2018 personal. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate, WKScriptMessageHandler {
    var elmDict = [String:UIView?]()
    
    lazy var imageView : UIImageView = {
        let image: UIImage = UIImage(named: "maria")!
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    lazy var webView: WKWebView = {
        let userContentController = WKUserContentController()
        userContentController.add(self, name: "positionChange")
        let config = WKWebViewConfiguration()
        config.userContentController = userContentController
        let webView = WKWebView(frame: .zero, configuration: config)
        webView.navigationDelegate = self
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        webView.frame = view.bounds;
        self.view.addSubview(webView)
        
//        let layoutGuide = view.safeAreaLayoutGuide
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        webView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        webView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        webView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
        // Load a website
//        let url = URL(string: "https://www.yahoo.com")!
//        webView.load(URLRequest(url: url))
        
        if let filePath = Bundle.main.path(forResource: "index", ofType: "html", inDirectory: "web") {
            let fileUrl = URL(fileURLWithPath: filePath)
            let fileDirUrl = fileUrl.deletingLastPathComponent()
            
            webView.loadFileURL(fileUrl, allowingReadAccessTo: fileDirUrl)
            
            

            let embedView = EmbedView(frame: CGRect.zero)
            elmDict["test1"] = embedView
            webView.scrollView.addSubview(embedView)
            webView.scrollView.addSubview(imageView)
            
        }
        webView.allowsBackForwardNavigationGestures = false
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "positionChange", let messageBody = message.body as? String {
            print(messageBody)
            updateEmbedElm(forElmId: "test1", CGRectFromString(messageBody))
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // get Rect from element
//        getRectForElm(forElmId: "test1")
    }
    
//    private func getRectForElm(forElmId elmId: String) {
////        let js = "function f(){ var r = document.getElementById('%@').getBoundingClientRect(); return '{{'+r.left+','+(r.top)+'},{'+r.width+','+r.height+'}}'; } f();";
//        webView.evaluateJavaScript(String(format: js, elmId)) { [weak self] (result, error) in
//            if self != nil, let rectString = result as? String, error == nil {
//                let rect = CGRectFromString(rectString)
//                self!.updateEmbedElm(forElmId: elmId, rect)
////                self?.updateEmbedElm(forElmId: elmId, CGRect(x: 0, y: 200, width: (self?.view.frame.width)!, height: 300))
//            }
//        }
//    }
    
    private func updateEmbedElm(forElmId elmId: String, _ frame: CGRect) {
        if let elm = elmDict[elmId] {
            elm!.frame = frame
            webView.scrollView.setNeedsLayout()
            webView.scrollView.setNeedsDisplay()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

