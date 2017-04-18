//
//  CardTableViewCell.swift
//  Calendouer
//
//  Created by 段昊宇 on 2017/3/6.
//  Copyright © 2017年 Desgard_Duan. All rights reserved.
//

import UIKit
import Kingfisher

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
            if let thisMovie = movie {
                self.eventTitle.text = thisMovie.title
                self.cardTitleLabel.text = "每日电影"
                self.ratingLabel.text = thisMovie.rating
                self.incLabel.text = thisMovie.summary
                self.illImageView.kf.setImage(with: URL(string: (thisMovie.images)))
                self.setRatingStar(rating: NSString(string: thisMovie.rating).doubleValue)
            }
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
        self.illImageView.kf.setImage(with: URL(string: (image)))
    }
    
    // 计算评分星级
    public func setRatingStar(rating: Double) {
        var index: Int = 0
        let score: Double = rating * 10
        let count: Int = Int(score) / 10
        let starCnt: Int = count / 2
        let halfStarCnt: Int = count % 2
        for _ in 0..<starCnt {
            let starView = starArray[index]
            starView.image = UIImage(named: "ca_star")
            index += 1
        }
        if halfStarCnt == 1 {
            let starView = starArray[index]
            starView.image = UIImage(named: "ca_star_half")
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
