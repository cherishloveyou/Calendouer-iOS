//
//  SwitchSettingTableViewCell.swift
//  Calendouer
//
//  Created by 段昊宇 on 2017/3/9.
//  Copyright © 2017年 Desgard_Duan. All rights reserved.
//

import UIKit
import SnapKit
import TKSwitcherCollection

class SwitchSettingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    var onSwitch: TKSmileSwitch = {
        var _switch = TKSmileSwitch(frame: CGRect(x: 0, y: 0, width: 40, height: 20))
        _switch.backgroundColor = UIColor.clear
        return _switch
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        initialView()
        setLayout()
    }
    
    private func initialView() {
        self.addSubview(onSwitch)
    }
    
    private func setLayout() {
        onSwitch.snp.makeConstraints { (make) in
            make.right.equalTo(self.snp.right).offset(-30)
            make.centerY.equalTo(titleLabel)
            make.height.equalTo(20)
            make.width.equalTo(40)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
