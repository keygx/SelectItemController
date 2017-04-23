//
//  Protocols.swift
//  SelectItemController
//
//  Created by keygx on 2017/04/18.
//  Copyright © 2017年 keygx. All rights reserved.
//

import UIKit

@objc public protocol ItemTableViewDelegate {
    @objc func didTapped(index: Int)
}

public protocol ItemTableViewType {
    weak var itemTableViewDelegate: ItemTableViewDelegate? { get set }
}
