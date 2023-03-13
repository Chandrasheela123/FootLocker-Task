//
//  AlertHandler.swift
//  FootLocker-Task
//
//  Created by Chandrasheela Hotkar on 09/03/23.
//

import Foundation
import UIKit

extension UIViewController{

func showAlert(title: String, message : String){
    
    let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    
    alertVC.addAction(okAction)
    present(alertVC, animated: false, completion: nil)
    
    
}
}
