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

final class SelectItemViewController: UIViewController, ItemTableViewDelegate {

    var dialogTitle = ""
    var buttonTitle = ""
    var itemTableView: ItemTableViewType?
    var items: [String]?
    
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var btnClose: UIButton?
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var dialogView: UIView?
    @IBOutlet weak var effectView: UIView!
    
    var selectItemViewControllerDelegate: SelectItemViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if self.view.isDarkMode {
            dialogView?.layer.borderColor = UIColor.clear.cgColor
            effectView.isHidden = true
            titleLabel?.backgroundColor = UIColor(red: 44.0/255.0, green: 44.0/255.0, blue: 46.0/255.0, alpha: 1.0)
            btnClose?.backgroundColor = UIColor(red: 44.0/255.0, green: 44.0/255.0, blue: 46.0/255.0, alpha: 1.0)
        } else {
            dialogView?.layer.borderColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 0.4).cgColor
            effectView.isHidden = false
            effectView?.layer.cornerRadius = 12.0
        }
        
        // DialogView
        dialogView?.layer.cornerRadius = 12.0
        dialogView?.layer.borderWidth = 1.0
        
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
