//
//  CardTableViewCell.swift
//  Calendouer
//
//  Created by 段昊宇 on 2017/3/6.
//  Copyright © 2017年 Desgard_Duan. All rights reserved.
//

import UIKit
import SDWebImage

class CardTableViewCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var incLabel: UILabel!
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var cardTitleLabel: UILabel!
    @IBOutlet weak var illImageView: UIImageView!
    
    var movie: MovieObject? {
        didSet {
            self.eventTitle.text = movie?.title
            self.cardTitleLabel.text = "每日电影"
            self.ratingLabel.text = movie?.rating
            self.incLabel.text = movie?.summary
            self.illImageView.sd_setImage(with: URL(string: (movie?.images)!))
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialView()
    }
    
    private func initialView() {
        self.backgroundColor = UIColor.clear
        cardView.layer.masksToBounds = true
        cardView.layer.cornerRadius = 3
        cardView.layer.shadowOpacity = 0.5
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowRadius = 3
        cardView.layer.shadowOffset = CGSize(width: 1, height: 1)
        cardView.clipsToBounds = false
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 1
    }
    
    public func initialContent(type: String, rate: String, title: String, content: String, image: String) {
        self.cardTitleLabel.text = type
        self.ratingLabel.text = rate
        self.eventTitle.text = title
        self.incLabel.text = content
        self.illImageView.sd_setImage(with: URL(string: image))
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
