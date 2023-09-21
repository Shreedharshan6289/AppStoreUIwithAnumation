//
//  SecondCollectionViewCell.swift
//  iOSTask
//
//  Created by Shreedharshan on 21/09/23.
//

import UIKit

class SecondCollectionViewCell: UICollectionViewCell {
    
    let containerView = UIView()
    let numLbl = UILabel()
    
    
    var layoutDict = [String:Any]()
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setupViews()
    }
    
    func setupViews() {
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["containerView"] = containerView
        self.addSubview(containerView)
        
        numLbl.textColor = .white
        numLbl.clipsToBounds = true
        numLbl.textAlignment = .center
        numLbl.font = UIFont.systemFont(ofSize: 16,weight: .medium)
        numLbl.layer.cornerRadius = 40
        numLbl.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["numLbl"] = numLbl
        containerView.addSubview(numLbl)
        
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[containerView]-5-|", metrics: nil, views: layoutDict))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-5-[containerView]-5-|", metrics: nil, views: layoutDict))
        
        containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[numLbl(80)]-10-|", metrics: nil, views: layoutDict))
        containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[numLbl(80)]|", metrics: nil, views: layoutDict))
        
        
    }
    
    
}
