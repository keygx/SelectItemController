//
//  ViewController.swift
//  SelectItemControllerSample
//
//  Created by keygx on 2017/03/14.
//  Copyright © 2017年 keygx. All rights reserved.
//

import UIKit
import SelectItemController

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func btnDefaultAction(_ sender: UIButton) {
        
        let items = ["First Item", "Second Item", "Third Item", "Fourth Item", "Fifth Item"]
        let params = Parameters(title: "Select Item ...", items: items, cancelButton: "Cancel")
        
        SelectItemController().show(parent: self, params: params) { (index) in
            if let index = index {
                print("selected: \(items[index])")
            } else {
                print("cancel")
            }
        }
    }
    
    @IBAction func btnCustomAction(_ sender: UIButton) {
        
        let customTableView = CustomTableView()
        let params = Parameters(title: "Select Item ...", itemTableView: customTableView, cancelButton: "Cancel")
        
        SelectItemController().show(parent: self, params: params) { (index) in
            if let index = index {
                print("selected: \(customTableView.items[index])")
            } else {
                print("cancel")
            }
        }
    }
}
