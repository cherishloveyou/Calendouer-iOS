//
//  SwitchCardTableViewCell.swift
//  Calendouer
//
//  Created by 段昊宇 on 2017/3/7.
//  Copyright © 2017年 Desgard_Duan. All rights reserved.
//

import UIKit

class SwitchCardTableViewCell: UITableViewCell {

    @IBOutlet weak var aniSwitch: AnimatedSwitch!
    @IBOutlet weak var content: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
