//
//  CornerRadius.swift
//  FootLocker-Task
//
//  Created by Chandrasheela Hotkar on 08/03/23.
//

import Foundation
import UIKit

extension UIView{
    @IBInspectable var cornerRadius: CGFloat{
        get{
            return layer.cornerRadius
        }
        set{
            layer.cornerRadius = newValue
            layer.masksToBounds = true
            self.clipsToBounds = true
        }
    }
}
