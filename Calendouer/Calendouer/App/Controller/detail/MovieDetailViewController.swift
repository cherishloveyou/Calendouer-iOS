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
        self.title = "电影"
        
        tableView = UITableView(frame: view.bounds, style: UITableViewStyle.grouped)
        tableView .backgroundView?.backgroundColor = DouGreen
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
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
}

extension MovieDetailViewController: UITableViewDataSource {
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell()
        return cell
    }
}
