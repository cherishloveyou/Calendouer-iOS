//
//  MoviePostTableViewCell.swift
//  Calendouer
//
//  Created by 段昊宇 on 2017/3/25.
//  Copyright © 2017年 Desgard_Duan. All rights reserved.
//

import UIKit

class MoviePostTableViewCell: UITableViewCell {

    @IBOutlet weak var bakView: UIView!
    @IBOutlet weak var ablumImage: UIImageView!
    
    var movie: MovieObject? {
        didSet {
            self.ablumImage.sd_setImage(with: URL(string: (movie?.images)!))
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bakView.backgroundColor = DouGreen
        
        ablumImage.layer.shadowColor = UIColor.black.cgColor
        ablumImage.layer.shadowOffset = CGSize(width: 1, height: 1)
        ablumImage.layer.shadowOpacity = 0.8
        ablumImage.layer.shadowRadius = 4
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
