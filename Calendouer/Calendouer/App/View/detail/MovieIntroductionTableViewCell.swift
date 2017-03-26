//
//  MovieIntroductionTableViewCell.swift
//  Calendouer
//
//  Created by 段昊宇 on 2017/3/26.
//  Copyright © 2017年 Desgard_Duan. All rights reserved.
//

import UIKit

class MovieIntroductionTableViewCell: UITableViewCell {

    @IBOutlet weak var ratingCardView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        ratingCardView.layer.shadowColor = UIColor.black.cgColor
        ratingCardView.layer.shadowOffset = CGSize(width: 1, height: 1)
        ratingCardView.layer.shadowOpacity = 0.6
        ratingCardView.layer.shadowRadius = 4
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
