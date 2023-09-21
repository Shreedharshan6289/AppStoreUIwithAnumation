//
//  AppScreenshortsCell.swift
//  iOSTask
//
//  Created by Shreedharshan on 21/09/23.
//

import UIKit


class AppScreenshortsCell: UICollectionViewCell {
    
    let imgView = UIImageView()
    
    var layoutDict = [String:Any]()
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setupViews()
    }
    
    func setupViews() {
        imgView.backgroundColor = .systemGray.withAlphaComponent(0.7)
        imgView.contentMode = .scaleAspectFit
        imgView.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["imgView"] = imgView
        self.addSubview(imgView)
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[imgView]|", metrics: nil, views: layoutDict))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[imgView]|", metrics: nil, views: layoutDict))
        
    }
    
    
}
