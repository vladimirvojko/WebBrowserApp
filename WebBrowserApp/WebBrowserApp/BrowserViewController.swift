//
//  ViewController.swift
//  WebBrowserApp
//
//  Created by Developer on 6/6/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import UIKit
import WebKit

class BrowserViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var searchBar: SearchTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.uiDelegate = self
        webView.navigationDelegate = self
        searchBar.filterStrings(["Red", "Blue", "Bfjfjfg", "Bhhfiusdh", "Bsdfgs", "Yellow"])
        
        
        
        let url = URL(string:"https://www.google.com")
        let request = URLRequest(url: url!)
        webView.load(request)
    }
    
    //    MARK: - IBActions
    @IBAction func goBack(_ sender: Any) {
        guard webView.canGoBack else { return }
        webView.goBack()
    }
    
    @IBAction func goForward(_ sender: Any) {
        guard webView.canGoForward else { return }
        webView.goForward()
    }
    
    
}

/*
extension BrowserViewController: UISearchBarDelegate {
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.resignFirstResponder()
        
        if let searchText = self.searchBar.text, let url = URL(string: searchText) {
            //Get the URL from the search bar. Create a new NSURLRequest with it and tell the webView to navigate to that URL/Page. Also specify a timeout for if the page takes too long. Also handles cookie/caching policy.
            
            let request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30)
            self.webView.load(request)
        }
    }
}
*/
