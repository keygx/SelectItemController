//
//  SelectItemViewController.swift
//  SelectItemController
//
//  Created by keygx on 2017/03/14.
//  Copyright © 2017年 keygx. All rights reserved.
//

import UIKit

protocol SelectItemViewControllerDelegate {
    func didSelected(index: Int?)
}

final class SelectItemViewController: UIViewController, ItemTableViewDelegate, MatchParentConstraintType {

    var dialogTitle = ""
    var buttonTitle = ""
    var itemTableView: ItemTableViewType?
    var items: [String]?
    
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var btnClose: UIButton?
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var dialogView: UIView?
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var titleEffectView: UIVisualEffectView!
    @IBOutlet weak var btnEffectView: UIVisualEffectView!
    @IBOutlet weak var tableHeightConstraint: NSLayoutConstraint!
    
    var selectItemViewControllerDelegate: SelectItemViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if self.view.isDarkMode {
            dialogView?.layer.borderColor = UIColor.clear.cgColor
            titleView?.backgroundColor = UIColor(red: 44.0/255.0, green: 44.0/255.0, blue: 46.0/255.0, alpha: 1.0)
            titleEffectView.isHidden = true
            btnClose?.backgroundColor = UIColor(red: 44.0/255.0, green: 44.0/255.0, blue: 46.0/255.0, alpha: 1.0)
            btnEffectView.isHidden = true
        } else {
            dialogView?.layer.borderColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 0.4).cgColor
            titleEffectView.isHidden = false
            btnEffectView.isHidden = false
        }
        
        // DialogView
        dialogView?.layer.cornerRadius = 12.0
        dialogView?.layer.borderWidth = 1.0
        dialogView?.clipsToBounds = true
        
        // Modal Background
        view.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.4)
        
        // Title Label
        titleLabel?.text = dialogTitle
        // Button Label
        btnClose?.setTitle(buttonTitle, for: .normal)
        
        // Item List
        if let tableView = itemTableView {
            // Custom
            let itemTableView = tableView
            itemTableView.itemTableViewDelegate = self
            
            let v = itemTableView as! UITableView
            v.frame = CGRect(x: 0,
                             y: 0,
                             width: containerView.frame.width,
                             height: containerView.frame.height)
            
            containerView.addSubview(v)
            
            setConstraint(parent: containerView, subView: v)
            
        } else {
            // Default
            let itemTableView = DefaultTableView(frame: CGRect(x: 0,
                                                               y: 0,
                                                               width: containerView.frame.width,
                                                               height: containerView.frame.height),
                                                 style: .plain)
            if let items = items {
                itemTableView.items = items
            }
            
            itemTableView.itemTableViewDelegate = self
            
            containerView.addSubview(itemTableView)
            
            setConstraint(parent: containerView, subView: itemTableView)
        }
    }
    
    override func viewWillLayoutSubviews() {
        // adjust height
        let height = UIScreen.main.bounds.size.height
        if height <= 320 {
            tableHeightConstraint.constant = 44 * 3 + 6
            titleLabel?.numberOfLines = 1
        } else if height <= 375 {
            tableHeightConstraint.constant = 44 * 4 + 6
            titleLabel?.numberOfLines = 2
        } else if height <= 428 {
            tableHeightConstraint.constant = 44 * 5 + 6
            titleLabel?.numberOfLines = 2
        } else if height <= 568 {
            tableHeightConstraint.constant = 44 * 5 + 6
            titleLabel?.numberOfLines = 8
        } else if height <= 667 {
            tableHeightConstraint.constant = 44 * 6 + 6
            titleLabel?.numberOfLines = 9
        } else {
            tableHeightConstraint.constant = 44 * 6 + 6
            titleLabel?.numberOfLines = 10
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func didTapped(index: Int) {
        // Selected
        dismiss(animated: false, completion: { [weak self] in
            // Delegate
            self?.selectItemViewControllerDelegate?.didSelected(index: index)
        })
    }
    
    @IBAction func btnCloseAction(_ sender: UIButton) {
        // Close Dialog
        dismiss(animated: false, completion: { [weak self] in
            // Delegate
            self?.selectItemViewControllerDelegate?.didSelected(index: nil)
        })
    }
}
