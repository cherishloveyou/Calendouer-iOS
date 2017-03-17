//
//  DemoViewController.swift
//  Calendouer
//
//  Created by 木瓜 on 2017/3/17.
//  Copyright © 2017年 Desgard_Duan. All rights reserved.
//

import UIKit

// 针对SettingViewController 可以用这种方式去配置cell, 好处就是以后增加或者减少只用修改一个地方. 原来的方式至少要修改两个地方, 就是dataResource和delegate都要改

class DemoViewController: UIViewController {
    
    var tableView: UITableView!
    var dataResource = [[TableCellData]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView.init(frame: view.bounds, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.register(UINib(nibName: "SwitchSettingTableViewCell", bundle: nil), forCellReuseIdentifier: "SwitchSettingTableViewCell")
        tableView.estimatedRowHeight = 80
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        configTableViewData()
    }
    
    func configTableViewData() {
        var section1: [TableCellData] = []
        var section2: [TableCellData] = []
        
        
        let cell1 = ListCellData<UITableViewCell>.init(identifier: "UITableViewCell", configuration: { (cell, index) in
            // config cell
        }, selection: { (index) in
            // do something
        }) { () -> CGFloat in
            return 90
        }
        section1.append(cell1)
        
        let cell2 = ListCellData<SwitchSettingTableViewCell>.init(identifier: "UITableViewCell", configuration: { (cell, index) in
            // config cell
        }, selection: { (index) in
            // do something
        }) { () -> CGFloat in
            return 90
        }
        section1.append(cell2)

        let cell3 = ListCellData<UITableViewCell>.init(identifier: "UITableViewCell", configuration: { (cell, index) in
            
        }, selection: nil, height: nil)
        section2.append(cell3)
        
        dataResource.append(section1)
        dataResource.append(section2)
        tableView.reloadData()
        
    }
}

extension DemoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = dataResource[indexPath.section][indexPath.row]
        if let rowHeight = cell.cellHeight {
            return rowHeight
        }
        return tableView.estimatedRowHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let cell = dataResource[indexPath.section][indexPath.row]
        cell.select(indexPath: indexPath)
    }
}

extension DemoViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataResource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataResource[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellData = dataResource[indexPath.section][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellData.identifier
            , for: indexPath)
        cellData.build(tableCell: cell, at: indexPath)
        return cell

        
    }
}
