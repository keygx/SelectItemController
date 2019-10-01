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
        if self.isDarkMode {
            selectedView.backgroundColor = UIColor(red: 58.0/255.0, green: 58.0/255.0, blue: 60.0/255.0, alpha: 1.0)
        } else {
            selectedView.backgroundColor = UIColor(red: 209.0/255.0, green: 208.0/255.0, blue: 213.0/255.0, alpha: 1.0)
        }
        cell.selectedBackgroundView = selectedView
        
        // Left Margin
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.layoutMargins = UIEdgeInsets.zero
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // Styles
        if self.isDarkMode {
            cell.textLabel?.textColor = UIColor.white
            cell.backgroundColor = UIColor.clear
            tableView.backgroundColor = UIColor(red: 28.0/255.0, green: 28.0/255.0, blue: 30.0/255.0, alpha: 1.0)
            tableView.separatorColor = UIColor(red: 84.0/255.0, green: 84.0/255.0, blue: 88.0/255.0, alpha: 0.6)
        } else {
            cell.backgroundColor = UIColor.clear
            tableView.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.95)
            tableView.separatorColor = UIColor.lightGray
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Styles
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Delegate
        itemTableViewDelegate?.didTapped(index: indexPath.row)
    }
}
