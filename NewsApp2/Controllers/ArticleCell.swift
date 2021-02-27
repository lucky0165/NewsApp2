//
//  ArticleCell.swift
//  NewsApp2
//
//  Created by Łukasz Rajczewski on 27/02/2021.
//

import UIKit

class ArticleCell: UITableViewCell {

    @IBOutlet weak var imageToDisplay: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    
    var articleToDisplay: Article?
    
    func displayArticle(article: Article) {
        
        articleToDisplay = article
        
        titleLabel.text = articleToDisplay?.title
        getImage()
    }
    
    func getImage() {
        
        guard let urlString = articleToDisplay?.urlToImage else {
            return
        }
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        let session = URLSession(configuration: .default)
        
        
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            
            if error == nil && data != nil {
                
                if self.articleToDisplay?.urlToImage == urlString {
                    DispatchQueue.main.async {
                        self.imageToDisplay.image = UIImage(data: data!)
                    }
                } // End if
        
            } // End if
            
        } // End Data task
        
        dataTask.resume()
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
