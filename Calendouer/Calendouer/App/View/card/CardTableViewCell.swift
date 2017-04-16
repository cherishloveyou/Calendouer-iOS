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
    
    // Star For Rating
    @IBOutlet weak var star_1: UIImageView!
    @IBOutlet weak var star_2: UIImageView!
    @IBOutlet weak var star_3: UIImageView!
    @IBOutlet weak var star_4: UIImageView!
    @IBOutlet weak var star_5: UIImageView!
    private var starArray = [UIImageView]()
    
    var movie: MovieObject? {
        didSet {
            self.eventTitle.text = movie?.title
            self.cardTitleLabel.text = "每日电影"
            self.ratingLabel.text = movie?.rating
            self.incLabel.text = movie?.summary
            self.illImageView.sd_setImage(with: URL(string: (movie?.images)!))
            self.setRatingStar(rating: (movie?.rating as! NSString).doubleValue)
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
        
        starArray.append(star_1)
        starArray.append(star_2)
        starArray.append(star_3)
        starArray.append(star_4)
        starArray.append(star_5)
        
        for star in starArray {
            let starView: UIImageView = star 
            starView.tintColor = DouStarYellow
        }
    }
    
    public func initialContent(type: String, rate: String, title: String, content: String, image: String) {
        self.cardTitleLabel.text = type
        self.ratingLabel.text = rate
        self.eventTitle.text = title
        self.incLabel.text = content
        self.illImageView.sd_setImage(with: URL(string: image))
    }
    
    // 计算评分星级
    public func setRatingStar(rating: Double) {
        var index: Int = 0
        var score: Double = rating
        while index <= 5 {
            score -= 1.0
            let starView = starArray[index]
            if score < 0 {
                starView.image = UIImage(named: "ca_star_half")
                break
            }
            score -= 1.0
            if score < 0 {
                break
            }
            starView.image = UIImage(named: "ca_star")
            index += 1
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
