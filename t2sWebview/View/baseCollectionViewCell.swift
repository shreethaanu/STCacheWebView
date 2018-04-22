//
//  baseCollectionViewCell.swift
//  t2sWebview
//
//  Created by Shree Thaanu on 4/21/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit

class baseCollectionViewCell: UICollectionViewCell {
    // This webview prints the URL in collectionview
    @IBOutlet weak var listWebView: UIWebView!
    
    func collectionViewDisplayAnimation(){
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: CGFloat(10), height: CGFloat(10))
        self.layer.transform = CATransform3DMakeScale(0.85, 0.85, 0.85)
        UIView.beginAnimations("scaleTableViewCellAnimationID", context: nil)
        UIView.setAnimationDuration(0.7)
        self.layer.shadowOffset = CGSize(width: CGFloat(0), height: CGFloat(0))
        self.alpha = 1
        self.layer.transform = CATransform3DIdentity
        UIView.commitAnimations()
    }
}
