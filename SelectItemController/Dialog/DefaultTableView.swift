//
//  DefaultTableView.swift
//  SelectItemController
//
//  Created by keygx on 2017/04/18.
//  Copyright © 2017年 keygx. All rights reserved.
//

import UIKit

final class DefaultTableView: UITableView, ItemTableViewType {

    var items = [String]()
    weak var itemTableViewDelegate: ItemTableViewDelegate?
    
    public override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialize() {
        
        backgroundColor = UIColor.clear
        
        register(UITableViewCell.self, forCellReuseIdentifier: "SelectItemCell")
        delegate = self
        dataSource = self
    }
}

extension DefaultTableView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
}

extension DefaultTableView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelectItemCell", for: indexPath)
        cell.textLabel!.text = items[indexPath.row]
        
        // Tapped Color
        let selectedView = UIView()
        selectedView.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 0.3)
        cell.selectedBackgroundView = selectedView
        
        // Left Margin
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.layoutMargins = UIEdgeInsets.zero
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // Styles
        cell.backgroundColor = UIColor.clear
        tableView.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.95)
        tableView.separatorColor = UIColor.lightGray
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Styles
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Delegate
        itemTableViewDelegate?.didTapped(index: indexPath.row)
    }
}
