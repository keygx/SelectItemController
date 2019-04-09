//
//  SelectItemController.swift
//  SelectItemController
//
//  Created by keygx on 2017/03/14.
//  Copyright © 2017年 keygx. All rights reserved.
//

import UIKit

public struct Parameters {
    public var title: String
    public var itemTableView: ItemTableViewType?
    public var items: [String]?
    public var cancelButton: String
    
    public init(
        title: String,
        items: [String],
        cancelButton: String
        ) {
        self.title = title
        self.itemTableView = nil
        self.items = items
        self.cancelButton = cancelButton
    }
    
    public init(
        title: String,
        itemTableView: ItemTableViewType,
        cancelButton: String
        ) {
        self.title = title
        self.itemTableView = itemTableView
        self.items = nil
        self.cancelButton = cancelButton
    }
}

final public class SelectItemController: NSObject, SelectItemViewControllerDelegate, UIViewControllerTransitioningDelegate {
    
    private var completionHandler: ((Int?) -> Void)?
    
    let customPresentAnimationController = CustomPresentAnimationController()
    
    public override init() {
        super.init()
        completionHandler = nil
    }
    
    public func show(parent: UIViewController, params: Parameters, completion: @escaping (Int?) -> Void) {
        
        let storyboard = UIStoryboard(name: "Dialog", bundle: Bundle(for: SelectItemViewController.self))
        let selectItemViewController = storyboard.instantiateInitialViewController() as! SelectItemViewController
        
        // Title Label
        selectItemViewController.dialogTitle = params.title
        
        // Button Label
        selectItemViewController.buttonTitle = params.cancelButton
        
        // Table
        selectItemViewController.itemTableView = params.itemTableView
        
        // Item
        selectItemViewController.items = params.items
        
        // Handler
        completionHandler = completion
        
        // Delegate
        selectItemViewController.selectItemViewControllerDelegate = self
        
        // Style
        selectItemViewController.modalPresentationStyle = .overCurrentContext
        
        // Transition
        selectItemViewController.transitioningDelegate = self
        
        // Present Modal
        parent.present(selectItemViewController, animated: true, completion: nil)
    }
    
    func didSelected(index: Int?) {
        defer {
            completionHandler = nil
        }
        
        // Callback
        if let handler = completionHandler {
            handler(index)
        }
    }
    
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return customPresentAnimationController
    }
    
    /*public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return customPresentAnimationController
    }*/
}
