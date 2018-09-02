//
//  UIViewController+Alert.swift
//  WeatherApp
//
//  Created by Ali Gungor on 1.09.2018.
//  Copyright © 2018 Ali Gungor. All rights reserved.
//

import UIKit

extension UIViewController {

    func showAlert(title: String? = nil, message: String? = nil, buttonTitle: String? = nil, buttonAction: @escaping (() -> Void) = {}) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: buttonTitle, style: .default) { (action) in
            buttonAction()
        }
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
}
