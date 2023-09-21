//
//  ThirdCollectionViewCell.swift
//  iOSTask
//
//  Created by Shreedharshan on 21/09/23.
//

import UIKit

class ThirdCollectionViewCell: UICollectionViewCell {
    
    let containerView = UIView()
    let imgView = UIImageView()
    
    
    var layoutDict = [String:Any]()
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setupViews()
    }
    
    func setupViews() {
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["containerView"] = containerView
        self.addSubview(containerView)
        
        imgView.layer.cornerRadius = 30
        imgView.backgroundColor = .systemGray.withAlphaComponent(0.7)
        imgView.contentMode = .scaleAspectFit
        imgView.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["imgView"] = imgView
        containerView.addSubview(imgView)
        
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[containerView]-5-|", metrics: nil, views: layoutDict))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-5-[containerView]-5-|", metrics: nil, views: layoutDict))
        
        containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[imgView(60)]-10-|", metrics: nil, views: layoutDict))
        containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[imgView(80)]|", metrics: nil, views: layoutDict))
        
        
    }
    
    
}
