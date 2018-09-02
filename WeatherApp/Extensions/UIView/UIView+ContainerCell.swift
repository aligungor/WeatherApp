//
//  UIView+ContainerCell.swift
//  WeatherApp
//
//  Created by Ali Gungor on 1.09.2018.
//  Copyright © 2018 Ali Gungor. All rights reserved.
//

import UIKit

extension UIView {
    
    var containerTableViewCell: UITableViewCell? {
        let senderView = self
        
        if let cell = self as? UITableViewCell {
            return cell
        }
        
        guard var containerView = senderView.superview else {
            return nil
        }
        
        while !(containerView is UITableViewCell) {
            if let sv = containerView.superview {
                containerView = sv
            } else {
                break
            }
        }
        
        return containerView as? UITableViewCell
    }
    
    func indexPath(at tableView: UITableView) -> IndexPath? {
        if let cell = containerTableViewCell, let indexPath = tableView.indexPath(for: cell) {
            return indexPath
        }
        return nil
    }
    
    var containerCollectionViewCell: UICollectionViewCell? {
        let senderView = self
        
        if let cell = self as? UICollectionViewCell {
            return cell
        }
        
        guard var containerView = senderView.superview else {
            return nil
        }
        
        while !(superview is UICollectionViewCell) {
            if let sv = containerView.superview {
                containerView = sv
            } else {
                break
            }
        }
        
        return containerView as? UICollectionViewCell
    }
    
    func indexPath(at collectionView: UICollectionView) -> IndexPath? {
        if let cell = containerCollectionViewCell, let indexPath = collectionView.indexPath(for: cell) {
            return indexPath
        }
        return nil
    }
    
}
