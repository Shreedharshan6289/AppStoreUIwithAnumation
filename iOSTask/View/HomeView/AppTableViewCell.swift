//
//  AppTableViewCell.swift
//  iOSTask
//
//  Created by Shreedharshan on 21/09/23.
//

import UIKit


class AppTableViewCell: UITableViewCell {
    
    let containerView = UIView()
    
    let imgAppIcon = UIImageView()
    
    let lblAppTitle = UILabel()
    let btnDownload = UIButton()
    
    var layoutDict = [String:Any]()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        self.selectionStyle = .none
        
        containerView.backgroundColor = .orange
        containerView.layer.cornerRadius = AppConstants.cornerRadius
        layoutDict["containerView"] = containerView
        containerView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(containerView)
        
        lblAppTitle.textColor = .black
        lblAppTitle.font = UIFont.systemFont(ofSize: 15)
        lblAppTitle.textAlignment = .center
        lblAppTitle.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["lblAppTitle"] = lblAppTitle
        containerView.addSubview(lblAppTitle)
        
        imgAppIcon.layer.cornerRadius = AppConstants.cornerRadius
        imgAppIcon.backgroundColor = .yellow
        imgAppIcon.contentMode = .scaleAspectFit
        imgAppIcon.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["imgAppIcon"] = imgAppIcon
        containerView.addSubview(imgAppIcon)
        
        btnDownload.setTitle("Download".uppercased(), for: .normal)
        btnDownload.isUserInteractionEnabled = false
        btnDownload.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        btnDownload.setTitleColor(.white, for: .normal)
        btnDownload.backgroundColor = .systemGreen
        btnDownload.layer.cornerRadius = AppConstants.cornerRadius
        btnDownload.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["btnDownload"] = btnDownload
        containerView.addSubview(btnDownload)
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-15-[containerView]-15-|", metrics: nil, views: layoutDict))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-15-[containerView]-15-|", metrics: nil, views: layoutDict))
        
        containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[imgAppIcon(110)]", metrics: nil, views: layoutDict))
        containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[imgAppIcon(110)]", metrics: nil, views: layoutDict))
        
        containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[btnDownload(50)]-20-|", metrics: nil, views: layoutDict))
        containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[btnDownload]-20-|", metrics: nil, views: layoutDict))
        
        lblAppTitle.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        lblAppTitle.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        
    }
}
