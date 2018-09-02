//
//  UIViewController+ActivityIndicator.swift
//  WeatherApp
//
//  Created by Ali Gungor on 1.09.2018.
//  Copyright © 2018 Ali Gungor. All rights reserved.
//

import UIKit
import SnapKit
import NVActivityIndicatorView

extension UIViewController {
    
    private var activityIndicatorSize: CGSize {
        return CGSize(width: 48, height: 48)
    }
    
    private var activityIndicatorColor: UIColor {
        return UIColor.black
    }
    
    private var activityIndicatorType: NVActivityIndicatorType {
        return NVActivityIndicatorType.circleStrokeSpin
    }
    
    @discardableResult
    func createActivityIndicatorView() -> NVActivityIndicatorView {
        let indicatorFrame = CGRect(origin: .zero, size: activityIndicatorSize)
        let activityIndicatorView = NVActivityIndicatorView(frame: indicatorFrame,
                                                            type: activityIndicatorType,
                                                            color: activityIndicatorColor)
        return activityIndicatorView
    }
    
    @discardableResult
    func showActivityIndicator(in containerView: UIView) -> NVActivityIndicatorView {
        let activityIndicatorView = createActivityIndicatorView()
        containerView.addSubview(activityIndicatorView)
        activityIndicatorView.snp.makeConstraints { (make) in
            make.center.equalTo(containerView)
        }
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }
    
    func hideActivityIndicator(in containerView: UIView) {
        containerView.subviews.forEach { (subview) in
            if let activityIndicatorView = subview as? NVActivityIndicatorView {
                activityIndicatorView.stopAnimating()
                activityIndicatorView.removeFromSuperview()
            }
        }
    }
    
}
