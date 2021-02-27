//
//  ArticleModel.swift
//  NewsApp2
//
//  Created by Łukasz Rajczewski on 27/02/2021.
//

import Foundation

protocol ArticleModelProtocol {
    
    func articlesRetrieved(_ articles: [Article])
    
}

struct ArticleModel {
    
    var delegate: ArticleModelProtocol?
    
    func getArticles() {
        
        let urlString = "https://newsapi.org/v2/everything?q=apple&from=2021-02-26&to=2021-02-26&sortBy=popularity&apiKey=cf98cc23f1014663877ad99113d69c1e"
        
        guard let url = URL(string: urlString) else {
            print("Couldn't create a url")
            return
        }
        
        let session = URLSession(configuration: .default)
        
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            
            if error == nil && data != nil {
                
                let decoder = JSONDecoder()
                
                do {
                    let decodedData = try decoder.decode(ArticleService.self, from: data!)
                    
                    let articles = decodedData.articles
                    
                    DispatchQueue.main.async {
                        delegate?.articlesRetrieved(articles)
                    }
 
                } catch {
                    print("Couldn't get the articles.")
                }
            }
            
        }
        
        dataTask.resume()
    }
    
}
