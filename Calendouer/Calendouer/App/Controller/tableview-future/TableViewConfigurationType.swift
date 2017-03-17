//
//  TableViewConfigurationType.swift
//  Calendouer
//
//  Created by 木瓜 on 2017/3/17.
//  Copyright © 2017年 Desgard_Duan. All rights reserved.
//

import Foundation
import UIKit

public protocol TableCellData{
    
    var identifier: String { get }
    var cellHeight: CGFloat? { get }
    
    func build(tableCell: UITableViewCell, at indexPath: IndexPath)
    func select(indexPath: IndexPath)
    
}


public class ListCellData<Cell>: NSObject {
    
    typealias CellConfiguration = ((Cell, IndexPath) -> Void)
    typealias CellSelection     = ((IndexPath) -> Void)
    typealias CellHeight        = (() -> CGFloat)
    
    public let identifier: String
    fileprivate let configuration: CellConfiguration?
    fileprivate let select: CellSelection?
    fileprivate let height: CellHeight?
    
    init(identifier: String = String(describing: Cell.self),
         configuration: CellConfiguration? = nil,
         selection:     CellSelection? = nil,
         height:        CellHeight?    = nil) {
        
        self.identifier = identifier
        self.configuration = configuration
        self.select = selection
        self.height = height
    }
    
    public var cellHeight: CGFloat? {
        return self.height?()
    }
}

extension ListCellData: TableCellData {
    
    public func build(tableCell: UITableViewCell, at indexPath: IndexPath) {
        let cell = tableCell as! Cell
        configuration?(cell, indexPath)
    }
    
    public func select(indexPath: IndexPath) {
        select?(indexPath)
    }
}
