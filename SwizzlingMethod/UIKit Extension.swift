//
//  UIKit Extension.swift
//  SwizzlingMethod
//
//  Created by Deepika on 18/06/20.
//  Copyright © 2020 Deepika. All rights reserved.
//

import Foundation
import UIKit

extension  UIViewController {
    
    @objc dynamic func swizzle_viewWillAppear(_ animated: Bool) {
        swizzle_viewWillAppear(animated)
        print("The view is being appeared!")
    }
    
    static func exchangeViewWillAppear() {
        
        let oldMethod = class_getInstanceMethod(UIViewController.self, #selector(UIViewController.viewWillAppear(_:)))
        let newMethod = class_getInstanceMethod(UIViewController.self, #selector(UIViewController.swizzle_viewWillAppear(_:)))
        
        guard let defaultMethod = oldMethod, let swizzlingMethod = newMethod else {
            assertionFailure("The selector doesn't belong to type specified!")
            return
        }
        
        method_exchangeImplementations(defaultMethod, swizzlingMethod)
    }
}
