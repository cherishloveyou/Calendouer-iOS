//
//  MovieSummaryTableViewCell.swift
//  Calendouer
//
//  Created by 段昊宇 on 2017/3/26.
//  Copyright © 2017年 Desgard_Duan. All rights reserved.
//

import UIKit

class MovieSummaryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var contentLabel: UILabel!
    
    var movie: MovieObject? {
        didSet {
            self.contentLabel.text = movie?.summary
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
