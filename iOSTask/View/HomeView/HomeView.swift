//
//  HomeView.swift
//  iOSTask
//
//  Created by Shreedharshan on 19/09/23.
//

import UIKit
import Loady

class HomeView: UIView {
    
    let homeView = UIView()
    
    let lblTitle = UILabel()
    let tblAppList = UITableView()
    
    let containerView = UIView()
    
    let imgAppIcon = UIImageView()
    let lblAppName = UILabel()
    let btnClose = UIButton()
    let lblAppDiscription = UILabel()
    let btnReadMore = UIButton()
    
    let screenShotsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    let stackPlay = UIStackView()
    
    let stackDownload = UIStackView()
    let btnDownload = LoadyButton()
    let btnCancelDownload = UIButton()
    
    let btnPlay = UIButton()
    
    var layoutDict = [String:Any]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(_ baseView: UIView) {
        
        baseView.backgroundColor = .white
        
        // FIRST LAYER
        
        layoutDict["homeView"] = homeView
        homeView.translatesAutoresizingMaskIntoConstraints = false
        baseView.addSubview(homeView)
        
        lblTitle.text = "PLAY"
        lblTitle.textColor = .black
        lblTitle.font = UIFont.boldSystemFont(ofSize: 20)
        lblTitle.textAlignment = .center
        layoutDict["lblTitle"] = lblTitle
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        homeView.addSubview(lblTitle)
        
        tblAppList.isScrollEnabled = false
        tblAppList.alwaysBounceVertical = false
        tblAppList.separatorStyle = .none
        tblAppList.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["tblAppList"] = tblAppList
        homeView.addSubview(tblAppList)
        
        // SECOND LAYER
        
        containerView.isHidden = true
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = AppConstants.cornerRadius
        layoutDict["containerView"] = containerView
        containerView.translatesAutoresizingMaskIntoConstraints = false
        baseView.addSubview(containerView)
        
        imgAppIcon.layer.cornerRadius = AppConstants.cornerRadius
        imgAppIcon.backgroundColor = .yellow
        imgAppIcon.contentMode = .scaleAspectFit
        imgAppIcon.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["imgAppIcon"] = imgAppIcon
        containerView.addSubview(imgAppIcon)
        
        lblAppName.text = "CANDY \n BUST"
        lblAppName.numberOfLines = 2
        lblAppName.textColor = .black
        lblAppName.font = UIFont.boldSystemFont(ofSize: 18)
        lblAppName.textAlignment = .left
        layoutDict["lblAppName"] = lblAppName
        lblAppName.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(lblAppName)
        
        btnClose.isHidden = true
        btnClose.setImage(UIImage(named: "ic_close"), for: .normal)
        btnClose.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["btnClose"] = btnClose
        containerView.addSubview(btnClose)
        
        lblAppDiscription.isHidden = true
        lblAppDiscription.text = "The discription of the app is written here"
        lblAppDiscription.textColor = .black
        lblAppDiscription.numberOfLines = 2
        lblAppDiscription.lineBreakMode = .byWordWrapping
        lblAppDiscription.font = UIFont.systemFont(ofSize: 15)
        lblAppDiscription.textAlignment = .left
        layoutDict["lblAppDiscription"] = lblAppDiscription
        lblAppDiscription.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(lblAppDiscription)
        
        btnReadMore.isHidden = true
        btnReadMore.setTitle("Read more", for: .normal)
        btnReadMore.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btnReadMore.setTitleColor(.systemGreen, for: .normal)
        btnReadMore.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["btnReadMore"] = btnReadMore
        containerView.addSubview(btnReadMore)
        
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .horizontal
        collectionLayout.minimumInteritemSpacing = 0
        screenShotsCollectionView.isHidden = true
        screenShotsCollectionView.collectionViewLayout = collectionLayout
        screenShotsCollectionView.alwaysBounceHorizontal = false
        screenShotsCollectionView.backgroundColor = .white
        screenShotsCollectionView.showsHorizontalScrollIndicator = false
        layoutDict["screenShotsCollectionView"] = screenShotsCollectionView
        screenShotsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(screenShotsCollectionView)
        
        stackPlay.axis = .vertical
        stackPlay.distribution = .fill
        stackPlay.alignment = .fill
        stackPlay.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["stackPlay"] = stackPlay
        containerView.addSubview(stackPlay)
        
        stackDownload.axis = .horizontal
        stackDownload.distribution = .fill
        stackDownload.alignment = .fill
        stackDownload.spacing = 10
        stackDownload.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["stackDownload"] = stackDownload
        stackPlay.addArrangedSubview(stackDownload)
        
        btnDownload.setAnimation(LoadyAnimationType.backgroundHighlighter())
        btnDownload.backgroundFillColor = .systemGreen
        btnDownload.loadingColor = .systemGreen
        btnDownload.clipsToBounds = true
        btnDownload.setTitle("Download \n 30 MB".uppercased(), for: .normal)
        btnDownload.titleLabel?.numberOfLines = 2
        btnDownload.titleLabel?.textAlignment = .center
        btnDownload.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btnDownload.setTitleColor(.white, for: .normal)
        btnDownload.backgroundColor = .systemGreen
        btnDownload.layer.cornerRadius = AppConstants.cornerRadius
        btnDownload.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["btnDownload"] = btnDownload
        stackDownload.addArrangedSubview(btnDownload)
        
        btnCancelDownload.isHidden = true
        btnCancelDownload.setImage(UIImage(named: "ic_close"), for: .normal)
        btnCancelDownload.backgroundColor = .yellow
        btnCancelDownload.layer.cornerRadius = AppConstants.cornerRadius
        btnCancelDownload.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["btnCancelDownload"] = btnCancelDownload
        stackDownload.addArrangedSubview(btnCancelDownload)
        
        btnPlay.isHidden = true
        btnPlay.setTitle("Play".uppercased(), for: .normal)
        btnPlay.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btnPlay.setTitleColor(.white, for: .normal)
        btnPlay.backgroundColor = .systemBlue
        btnPlay.layer.cornerRadius = AppConstants.cornerRadius
        btnPlay.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["btnPlay"] = btnPlay
        stackPlay.addArrangedSubview(btnPlay)
        
        
        // FIRST LAYER
        
        homeView.topAnchor.constraint(equalTo: baseView.safeAreaLayoutGuide.topAnchor).isActive = true
        homeView.bottomAnchor.constraint(equalTo: baseView.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        baseView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[homeView]|", metrics: nil, views: layoutDict))
        
        homeView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-40-[lblTitle]-15-[tblAppList]-50-|", options: [.alignAllLeading,.alignAllTrailing],metrics: nil, views: layoutDict))
        
        homeView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-15-[lblTitle]-15-|", metrics: nil, views: layoutDict))
        
        // SECOND LAYER
        
        containerView.topAnchor.constraint(equalTo: tblAppList.topAnchor,constant: 15).isActive = true
        
        baseView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-30-[containerView]-30-|", metrics: nil, views: layoutDict))
        
        let height = (AppConstants.screeenHeight * 0.7) - 30
        containerView.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[imgAppIcon(110)]-20-[lblAppDiscription]-20-[btnReadMore(20)]-15-[screenShotsCollectionView]-15-[stackPlay]-20-|", metrics: nil, views: layoutDict))
        
        containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-30-[lblAppName]", metrics: nil, views: layoutDict))
        containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-30-[btnClose(20)]", metrics: nil, views: layoutDict))
        
        containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[imgAppIcon(110)]-[lblAppName]-[btnClose(20)]-15-|", metrics: nil, views: layoutDict))
        
        containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[lblAppDiscription]-20-|", metrics: nil, views: layoutDict))
        
        containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[screenShotsCollectionView]|", metrics: nil, views: layoutDict))
        
        containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[stackPlay]-20-|", metrics: nil, views: layoutDict))
        
        btnReadMore.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        
        btnCancelDownload.widthAnchor.constraint(equalToConstant: 50).isActive = true
        btnDownload.heightAnchor.constraint(equalToConstant: 50).isActive = true
        btnPlay.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        baseView.layoutIfNeeded()
        
    }
    
    
}





