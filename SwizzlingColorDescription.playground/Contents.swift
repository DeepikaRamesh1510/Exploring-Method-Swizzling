import Foundation
import UIKit
public extension UIColor {
    @objc func colorDescription() -> String {
        return "This is color description!"
    }
    static func swizzleDesriptionImplementation(){
        let instance: UIColor = UIColor.red
        let aClass: AnyClass! = object_getClass(instance)
        let originalMethod = class_getInstanceMethod(aClass, #selector(description))
        let swizzledMethod = class_getInstanceMethod(aClass, #selector(colorDescription))
        if let originalMethod = originalMethod, let swizzledMethod = swizzledMethod {
            method_exchangeImplementations(originalMethod, swizzledMethod)
        }
    }
}

print(UIColor.red)
print(UIColor.green)
UIColor.swizzleDesriptionImplementation()
print("swizzled")
print(UIColor.yellow)
print(UIColor.blue)
