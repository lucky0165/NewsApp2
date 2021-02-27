//
//  ViewController.swift
//  NewsApp2
//
//  Created by Łukasz Rajczewski on 27/02/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var articles = [Article]()
    
    var model = ArticleModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        model.delegate = self 
        
        model.getArticles()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let detailVC = segue.destination as! DetailViewController
        
        let indexPath = tableView.indexPathForSelectedRow
        
        guard indexPath != nil else { return }
        
        let article = articles[indexPath!.row]
        
        detailVC.urlString = article.url!
  
    }
    
}


// MARK: - Article Model Protocol Methods

extension ViewController: ArticleModelProtocol {
    
    
    func articlesRetrieved(_ articles: [Article]) {
        self.articles = articles
        
        tableView.reloadData()
    }
    
    
}

// MARK: - TableView DataSource & Delegate Methods 

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return articles.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleCell
        
        let article = articles[indexPath.row]
        
        cell.displayArticle(article: article)
        
        return cell 
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "goToDetail", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        
    }
    
}



