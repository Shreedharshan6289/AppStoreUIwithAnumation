//
//  FirstCollectionViewCell.swift
//  iOSTask
//
//  Created by Shreedharshan on 21/09/23.
//

import UIKit

class FirstCollectionViewCell: UICollectionViewCell {
    
    let containerView = UIView()
    let imgView = UIImageView()
    let lblSubTitleOne = UILabel()
    let lblSubTitleTwo = UILabel()
    
    var layoutDict = [String:Any]()
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setupViews()
    }
    
    func setupViews() {
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["containerView"] = containerView
        self.addSubview(containerView)
        
        imgView.layer.cornerRadius = 50
        imgView.backgroundColor = .systemGray.withAlphaComponent(0.7)
        imgView.contentMode = .scaleAspectFit
        imgView.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["imgView"] = imgView
        containerView.addSubview(imgView)
        
        lblSubTitleOne.text = "                        "
        lblSubTitleOne.backgroundColor = .systemGray.withAlphaComponent(0.7)
        lblSubTitleOne.textAlignment = .left
        lblSubTitleOne.clipsToBounds = true
        lblSubTitleOne.layer.cornerRadius = 8
        layoutDict["lblSubTitleOne"] = lblSubTitleOne
        lblSubTitleOne.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(lblSubTitleOne)
        
        lblSubTitleTwo.text = "                "
        lblSubTitleTwo.backgroundColor = .systemGray.withAlphaComponent(0.7)
        lblSubTitleTwo.textAlignment = .left
        lblSubTitleTwo.clipsToBounds = true
        lblSubTitleTwo.layer.cornerRadius = 8
        layoutDict["lblSubTitleTwo"] = lblSubTitleTwo
        lblSubTitleTwo.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(lblSubTitleTwo)
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[containerView]-5-|", metrics: nil, views: layoutDict))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-5-[containerView]-5-|", metrics: nil, views: layoutDict))
        
        containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[imgView(100)]-10-[lblSubTitleOne(30)]-10-[lblSubTitleTwo(30)]-10-|", metrics: nil, views: layoutDict))
        containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[imgView(100)]|", metrics: nil, views: layoutDict))
        
        lblSubTitleOne.centerXAnchor.constraint(equalTo: imgView.centerXAnchor).isActive = true
        lblSubTitleTwo.centerXAnchor.constraint(equalTo: imgView.centerXAnchor).isActive = true
    }
    
    
}
