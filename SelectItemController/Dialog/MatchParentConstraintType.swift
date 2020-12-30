//
//  MatchParentConstraintType.swift
//  SelectItemController
//
//  Created by keygx on 2019/12/08.
//  Copyright © 2019 keygx. All rights reserved.
//

import UIKit

protocol MatchParentConstraintType {
    func setConstraint(parent: UIView, subView: UIView)
}

extension MatchParentConstraintType {
    
    func setConstraint(parent: UIView, subView: UIView) {
        subView.translatesAutoresizingMaskIntoConstraints = false
        
        // add Constraints
        let views = ["subview": subView]
        parent.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "V:|[subview]|",
                options: NSLayoutConstraint.FormatOptions(rawValue: 0),
                metrics: nil,
                views: views
            )
        )
        parent.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "H:|[subview]|",
                options: NSLayoutConstraint.FormatOptions(rawValue: 0),
                metrics: nil,
                views: views
            )
        )
    }
}
