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
    
    let customTableView = CustomTableView()
    
    var timer: Timer?
    var count = 0
    
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
        customTableView.items.removeAll()
        customTableView.items = ["First Item", "Second Item", "Third Item", "Fourth Item", "Fifth Item"]
        AsyncUtil.onMainThread({
            self.customTableView.reloadData()
        }, delay: 0.01)
        
        let params = Parameters(title: "Select Item ...", itemTableView: customTableView, cancelButton: "Cancel")
        
        SelectItemController().show(parent: self, params: params) { [weak self] (index) in
            guard let `self` = self else { return }
            
            if let index = index {
                print("selected: \(self.customTableView.items[index])")
            } else {
                print("cancel")
            }
        }
    }
    
    @IBAction func btnUpdateAction(_ sender: UIButton) {
        count = 0
        customTableView.items.removeAll()
        timer = Timer.scheduledTimer(timeInterval: 0.2,
                                     target: self,
                                     selector: #selector(ViewController.timerUpdate),
                                     userInfo: nil,
                                     repeats: true)
        timer?.fire()
        
        
        let params = Parameters(title: "Select Item ...", itemTableView: customTableView, cancelButton: "Cancel")
        
        SelectItemController().show(parent: self, params: params) { [weak self] (index) in
            guard let `self` = self else { return }
            self.timer?.invalidate()
            
            if let index = index {
                print("selected: \(self.customTableView.items[index])")
            } else {
                print("cancel")
            }
        }
    }
    
    @objc func timerUpdate(timer: Timer) {
        count += 1
        
        if count <= 10 {
            customTableView.items.append("item: \(count)")
            print("count: \(count)")
            AsyncUtil.onMainThread({
                self.customTableView.reloadData()
            }, delay: 0.01)
        } else {
            timer.invalidate()
            print("finish")
        }
    }
}
