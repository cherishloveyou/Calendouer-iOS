//
//  MovieDetailViewController.swift
//  Calendouer
//
//  Created by 段昊宇 on 2017/3/24.
//  Copyright © 2017年 Desgard_Duan. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {

    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialView()
        addSubView()
        settingLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        self.tabBarController?.tabBar.isHidden = true
    }
    
    private func initialView() {
        tableView = UITableView(frame: view.bounds, style: UITableViewStyle.plain)
        tableView.backgroundColor = DouGreen
        tableView.separatorColor = UIColor.clear
        tableView.dataSource = self
        tableView.delegate = self
        
        // Table View Register
        
        // Userdefalut
    }
    
    private func addSubView() {
        view.addSubview(tableView)
    }
    
    private func settingLayout() {
        
    }
    
}

extension MovieDetailViewController: UITableViewDelegate {
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}

extension MovieDetailViewController: UITableViewDataSource {
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell()
        return cell
    }
}
