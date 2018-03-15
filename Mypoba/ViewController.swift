//
//  ViewController.swift
//  Mypoba
//
//  Created by 행호 강 on 2017. 3. 31..
//  Copyright © 2017년 nuriware. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var initIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var webView: UIWebView!
    
    var isStartApp = false;
    
    let APPSTORE_PREFIX = "https://itunes.apple.com/in/app/";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        if Reachability.isConnectedToNetwork() == true {
//            print("conneted")
//        }else{
//            print("not connected")
//        }
        
        let str = "https://mypoba.or.kr"
        
        if let url = URL(string: str) {
            let urlRequest = URLRequest(url: url)
            
            webView.loadRequest(urlRequest)
            
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //print("didReceiveMemoryWarning")
        // Dispose of any resources that can be recreated.
    }
    
   


}

extension ViewController: UIWebViewDelegate {
    func webViewDidStartLoad(_ webView: UIWebView) {
        initIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        initIndicator.stopAnimating()
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        //print("shouldStartLoadWith")
        if let url = request.url, url.scheme != "http" && url.scheme != "https" {
            
            isStartApp = UIApplication.shared.openURL(url);
            return false;
        } else {
            
            if isStartApp {
                
                isStartApp = false;
                if (request.url?.absoluteString.contains(APPSTORE_PREFIX))! {
                    return false;
                } else {
                    return true;
                }
            }
            
            return true;
        }

    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        if let url = request.url, url.scheme != "http" && url.scheme != "https" {
            
            isStartApp = UIApplication.shared.openURL(url);
            return false;
        } else {
            
            if isStartApp {
                
                isStartApp = false;
                if (request.url?.absoluteString.contains(APPSTORE_PREFIX))! {
                    return false;
                } else {
                    return true;
                }
            }
            
            return true;
        }
    }

    
}



