//
//  DetailViewController.swift
//  NewsApp2
//
//  Created by Łukasz Rajczewski on 27/02/2021.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    var urlString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if urlString != nil {
            
            guard let url = URL(string: urlString!) else { return }
            
            let request = URLRequest(url: url)
            
    
            webView.load(request)
            
            
        }
    
    }
    
}

extension DetailViewController: WKNavigationDelegate {
    
}
