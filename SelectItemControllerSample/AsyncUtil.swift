//
//  AsyncUtil.swift
//  SelectItemControllerSample
//
//  Created by keygx on 2018/03/04.
//  Copyright © 2018年 keygx. All rights reserved.
//

import Foundation

class AsyncUtil {
    static func onMainThread(_ block: @escaping () -> Void, delay: Double) {
        if delay == 0.0 {
            DispatchQueue.main.async {
                block()
            }
            return
        }
        
        let d = DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: d) {
            block()
        }
    }
}
