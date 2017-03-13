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
    var items = [String]()
    
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var btnClose: UIButton?
    @IBOutlet weak var itemTableView: ItemTableView?
    @IBOutlet weak var dialogView: UIView?
    @IBOutlet weak var effectView: UIView!
    
    var selectItemViewControllerDelegate: SelectItemViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // EffectView
        effectView?.layer.cornerRadius = 12.0
        
        // DialogView
        dialogView?.layer.cornerRadius = 12.0
        dialogView?.layer.borderWidth = 1.0
        dialogView?.layer.borderColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 0.4).cgColor
        
        // Modal Background
        view.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.4)
        
        // Title Label
        titleLabel?.text = dialogTitle
        // Button Label
        btnClose?.setTitle(buttonTitle, for: .normal)
        
        // Item List
        itemTableView?.items = items
        itemTableView?.itemTableViewDelegate = self
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
