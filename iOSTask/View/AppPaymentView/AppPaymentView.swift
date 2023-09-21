//
//  AppPaymentView.swift
//  iOSTask
//
//  Created by Shreedharshan on 21/09/23.
//

import UIKit

class AppPaymentView: UIView {
    
    
    var layoutDict = [String:Any]()
    
    let bgView = UIView()
    let viewContent = UIView()
    let btnNext = UIButton()
    
    let stackDetails = UIStackView()
    
    let viewFirstDetails = UIView()
    let lblFirstTitle = UILabel()
    let firstCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    let viewSecondDetails = UIView()
    let lblSecondTitle = UILabel()
    let lblsecondSubTitle = UILabel()
    let secondCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    let viewWallet = UIView()
    let lblWalletBalanceTitle = UILabel()
    let lblWalletBalance = UILabel()
    
    let lblAmount = UILabel()
    let lblCheckBox = UILabel()
    
    
    let viewThirdDetails = UIView()
    let lblThirdTitle = UILabel()
    let lblThirdSubTitle = UILabel()
    let thirdCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    let viewthirdSubTitles = UIView()
    let lblThirdSubTitleOne = UILabel()
    let lblThirdSubTitleTwo = UILabel()
    
    let secondViewWallet = UIView()
    let secondlblWalletBalanceTitle = UILabel()
    let secondlblWalletBalance = UILabel()
    
    let secondlblAmount = UILabel()
    let secondlblCheckBox = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(_ baseView: UIView) {
        
        bgView.isHidden = true
        bgView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        bgView.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["bgView"] = bgView
        baseView.addSubview(bgView)
        
        viewContent.backgroundColor = .white
        viewContent.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["viewContent"] = viewContent
        baseView.addSubview(viewContent)
        
        btnNext.setTitle("Next".uppercased(), for: .normal)
        btnNext.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btnNext.setTitleColor(.white, for: .normal)
        btnNext.backgroundColor = .systemGreen
        btnNext.layer.cornerRadius = AppConstants.cornerRadius
        btnNext.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["btnNext"] = btnNext
        viewContent.addSubview(btnNext)
        
        stackDetails.axis = .vertical
        stackDetails.distribution = .fill
        stackDetails.alignment = .fill
        stackDetails.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["stackDetails"] = stackDetails
        viewContent.addSubview(stackDetails)
        
        // First View
        
        viewFirstDetails.backgroundColor = .white
        viewFirstDetails.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["viewFirstDetails"] = viewFirstDetails
        stackDetails.addArrangedSubview(viewFirstDetails)
        
        lblFirstTitle.isHidden = true
        lblFirstTitle.text = "                              "
        lblFirstTitle.backgroundColor = .systemGray.withAlphaComponent(0.7)
        lblFirstTitle.textAlignment = .left
        lblFirstTitle.clipsToBounds = true
        lblFirstTitle.layer.cornerRadius = 8
        layoutDict["lblFirstTitle"] = lblFirstTitle
        lblFirstTitle.translatesAutoresizingMaskIntoConstraints = false
        viewFirstDetails.addSubview(lblFirstTitle)
        
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .horizontal
        collectionLayout.minimumInteritemSpacing = 0
        firstCollectionView.isHidden = true
        firstCollectionView.isScrollEnabled = false
        firstCollectionView.collectionViewLayout = collectionLayout
        firstCollectionView.alwaysBounceHorizontal = false
        firstCollectionView.backgroundColor = .white
        firstCollectionView.showsHorizontalScrollIndicator = false
        layoutDict["firstCollectionView"] = firstCollectionView
        firstCollectionView.translatesAutoresizingMaskIntoConstraints = false
        viewFirstDetails.addSubview(firstCollectionView)
        
        
        // Second View
        
        viewSecondDetails.isHidden = true
        viewSecondDetails.backgroundColor = .white
        viewSecondDetails.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["viewSecondDetails"] = viewSecondDetails
        stackDetails.addArrangedSubview(viewSecondDetails)
        
        lblSecondTitle.isHidden = true
        lblSecondTitle.text = "                              "
        lblSecondTitle.backgroundColor = .systemGray.withAlphaComponent(0.7)
        lblSecondTitle.textAlignment = .left
        lblSecondTitle.clipsToBounds = true
        lblSecondTitle.layer.cornerRadius = 8
        layoutDict["lblSecondTitle"] = lblSecondTitle
        lblSecondTitle.translatesAutoresizingMaskIntoConstraints = false
        viewSecondDetails.addSubview(lblSecondTitle)
        
        lblsecondSubTitle.text = "                         "
        lblsecondSubTitle.backgroundColor = .systemGray.withAlphaComponent(0.7)
        lblsecondSubTitle.textAlignment = .left
        lblsecondSubTitle.clipsToBounds = true
        lblsecondSubTitle.layer.cornerRadius = 8
        layoutDict["lblsecondSubTitle"] = lblsecondSubTitle
        lblsecondSubTitle.translatesAutoresizingMaskIntoConstraints = false
        viewSecondDetails.addSubview(lblsecondSubTitle)
        
        let collectionLayoutTwo = UICollectionViewFlowLayout()
        collectionLayoutTwo.scrollDirection = .horizontal
        collectionLayoutTwo.minimumInteritemSpacing = 0
        secondCollectionView.isHidden = true
        secondCollectionView.isScrollEnabled = false
        secondCollectionView.collectionViewLayout = collectionLayoutTwo
        secondCollectionView.alwaysBounceHorizontal = false
        secondCollectionView.backgroundColor = .white
        secondCollectionView.isUserInteractionEnabled = true
        secondCollectionView.showsHorizontalScrollIndicator = false
        layoutDict["secondCollectionView"] = secondCollectionView
        secondCollectionView.translatesAutoresizingMaskIntoConstraints = false
        viewSecondDetails.addSubview(secondCollectionView)
        
        viewWallet.isHidden = true
        viewWallet.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["viewWallet"] = viewWallet
        viewSecondDetails.addSubview(viewWallet)
        
        lblWalletBalanceTitle.text = "Wallet Balance:"
        lblWalletBalanceTitle.textColor = .black
        lblWalletBalanceTitle.textAlignment = .left
        lblWalletBalanceTitle.font = UIFont.systemFont(ofSize: 16)
        layoutDict["lblWalletBalanceTitle"] = lblWalletBalanceTitle
        lblWalletBalanceTitle.translatesAutoresizingMaskIntoConstraints = false
        viewWallet.addSubview(lblWalletBalanceTitle)
        
        lblWalletBalance.text = "              "
        lblWalletBalance.backgroundColor = .systemGray.withAlphaComponent(0.7)
        lblWalletBalance.textAlignment = .left
        lblWalletBalance.clipsToBounds = true
        lblWalletBalance.layer.cornerRadius = 8
        layoutDict["lblWalletBalance"] = lblWalletBalance
        lblWalletBalance.translatesAutoresizingMaskIntoConstraints = false
        viewWallet.addSubview(lblWalletBalance)
        
        lblAmount.text = "             "
        lblAmount.backgroundColor = .systemGray.withAlphaComponent(0.7)
        lblAmount.textAlignment = .left
        lblAmount.clipsToBounds = true
        lblAmount.layer.cornerRadius = 8
        layoutDict["lblAmount"] = lblAmount
        lblAmount.translatesAutoresizingMaskIntoConstraints = false
        viewWallet.addSubview(lblAmount)
        
        lblCheckBox.backgroundColor = .systemGray.withAlphaComponent(0.7)
        lblCheckBox.textAlignment = .left
        lblCheckBox.clipsToBounds = true
        lblCheckBox.layer.cornerRadius = 8
        layoutDict["lblCheckBox"] = lblCheckBox
        lblCheckBox.translatesAutoresizingMaskIntoConstraints = false
        viewWallet.addSubview(lblCheckBox)
        
        // Third View
        
        viewThirdDetails.isHidden = true
        viewThirdDetails.backgroundColor = .white
        viewThirdDetails.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["viewThirdDetails"] = viewThirdDetails
        stackDetails.addArrangedSubview(viewThirdDetails)
        
        lblThirdTitle.isHidden = true
        lblThirdTitle.text = "Ready To Play?"
        lblThirdTitle.font = UIFont.systemFont(ofSize: 22,weight: .regular)
        lblThirdTitle.textColor = .black
        lblThirdTitle.textAlignment = .center
        lblThirdTitle.clipsToBounds = true
        lblThirdTitle.layer.cornerRadius = 8
        layoutDict["lblThirdTitle"] = lblThirdTitle
        lblThirdTitle.translatesAutoresizingMaskIntoConstraints = false
        viewThirdDetails.addSubview(lblThirdTitle)
        
        lblThirdSubTitle.text = "OSWALD"
        lblThirdSubTitle.font = UIFont.systemFont(ofSize: 25,weight: .medium)
        lblThirdSubTitle.textColor = .black
        lblThirdSubTitle.textAlignment = .center
        lblThirdSubTitle.clipsToBounds = true
        lblThirdSubTitle.layer.cornerRadius = 8
        layoutDict["lblThirdSubTitle"] = lblThirdSubTitle
        lblThirdSubTitle.translatesAutoresizingMaskIntoConstraints = false
        viewThirdDetails.addSubview(lblThirdSubTitle)
        
        viewthirdSubTitles.backgroundColor = .white
        viewthirdSubTitles.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["viewthirdSubTitles"] = viewthirdSubTitles
        viewThirdDetails.addSubview(viewthirdSubTitles)
        
        lblThirdSubTitleOne.text = "                    "
        lblThirdSubTitleOne.backgroundColor = .systemGray.withAlphaComponent(0.7)
        lblThirdSubTitleOne.textAlignment = .left
        lblThirdSubTitleOne.clipsToBounds = true
        lblThirdSubTitleOne.layer.cornerRadius = 8
        layoutDict["lblThirdSubTitleOne"] = lblThirdSubTitleOne
        lblThirdSubTitleOne.translatesAutoresizingMaskIntoConstraints = false
        viewthirdSubTitles.addSubview(lblThirdSubTitleOne)
        
        lblThirdSubTitleTwo.text = "            "
        lblThirdSubTitleTwo.backgroundColor = .systemGray.withAlphaComponent(0.7)
        lblThirdSubTitleTwo.textAlignment = .left
        lblThirdSubTitleTwo.clipsToBounds = true
        lblThirdSubTitleTwo.layer.cornerRadius = 8
        layoutDict["lblThirdSubTitleTwo"] = lblThirdSubTitleTwo
        lblThirdSubTitleTwo.translatesAutoresizingMaskIntoConstraints = false
        viewthirdSubTitles.addSubview(lblThirdSubTitleTwo)
        
        let collectionLayoutThree = UICollectionViewFlowLayout()
        collectionLayoutThree.scrollDirection = .horizontal
        collectionLayoutThree.minimumInteritemSpacing = 0
        thirdCollectionView.isHidden = true
        thirdCollectionView.isScrollEnabled = false
        thirdCollectionView.collectionViewLayout = collectionLayoutThree
        thirdCollectionView.alwaysBounceHorizontal = false
        thirdCollectionView.backgroundColor = .white
        thirdCollectionView.showsHorizontalScrollIndicator = false
        layoutDict["thirdCollectionView"] = thirdCollectionView
        thirdCollectionView.translatesAutoresizingMaskIntoConstraints = false
        viewThirdDetails.addSubview(thirdCollectionView)
        
        
        secondViewWallet.isHidden = true
        secondViewWallet.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["secondViewWallet"] = secondViewWallet
        viewThirdDetails.addSubview(secondViewWallet)
        
        secondlblWalletBalanceTitle.text = "Wallet Balance:"
        secondlblWalletBalanceTitle.textColor = .black
        secondlblWalletBalanceTitle.textAlignment = .left
        secondlblWalletBalanceTitle.font = UIFont.systemFont(ofSize: 16)
        layoutDict["secondlblWalletBalanceTitle"] = secondlblWalletBalanceTitle
        secondlblWalletBalanceTitle.translatesAutoresizingMaskIntoConstraints = false
        secondViewWallet.addSubview(secondlblWalletBalanceTitle)
        
        secondlblWalletBalance.text = "              "
        secondlblWalletBalance.backgroundColor = .systemGray.withAlphaComponent(0.7)
        secondlblWalletBalance.textAlignment = .left
        secondlblWalletBalance.clipsToBounds = true
        secondlblWalletBalance.layer.cornerRadius = 8
        layoutDict["secondlblWalletBalance"] = secondlblWalletBalance
        secondlblWalletBalance.translatesAutoresizingMaskIntoConstraints = false
        secondViewWallet.addSubview(secondlblWalletBalance)
        
        secondlblAmount.text = "             "
        secondlblAmount.backgroundColor = .systemGray.withAlphaComponent(0.7)
        secondlblAmount.textAlignment = .left
        secondlblAmount.clipsToBounds = true
        secondlblAmount.layer.cornerRadius = 8
        layoutDict["secondlblAmount"] = secondlblAmount
        secondlblAmount.translatesAutoresizingMaskIntoConstraints = false
        secondViewWallet.addSubview(secondlblAmount)
        
        secondlblCheckBox.backgroundColor = .systemGray.withAlphaComponent(0.7)
        secondlblCheckBox.textAlignment = .left
        secondlblCheckBox.clipsToBounds = true
        secondlblCheckBox.layer.cornerRadius = 8
        layoutDict["secondlblCheckBox"] = secondlblCheckBox
        secondlblCheckBox.translatesAutoresizingMaskIntoConstraints = false
        secondViewWallet.addSubview(secondlblCheckBox)
        
        // Constraints
        
        bgView.topAnchor.constraint(equalTo: baseView.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        bgView.bottomAnchor.constraint(equalTo: viewContent.topAnchor, constant: 0).isActive = true
        
        baseView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[bgView]|", options: [], metrics: nil, views: layoutDict))
        
        
        viewContent.bottomAnchor.constraint(equalTo: baseView.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        baseView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[viewContent]|", options: [], metrics: nil, views: layoutDict))
        
        
        viewContent.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[stackDetails]-10-[btnNext(50)]", options: [.alignAllLeading,.alignAllTrailing], metrics: nil, views: layoutDict))
        
        btnNext.bottomAnchor.constraint(equalTo: viewContent.bottomAnchor, constant: -20).isActive = true
        
        viewContent.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[btnNext]-20-|", options: [], metrics: nil, views: layoutDict))
        
        // FIRST VIEW
        
        viewFirstDetails.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[lblFirstTitle(30)]-15-[firstCollectionView(215)]-10-|", options: [], metrics: nil, views: layoutDict))
        
        lblFirstTitle.centerXAnchor.constraint(equalTo: viewFirstDetails.centerXAnchor).isActive = true
        
        viewFirstDetails.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-40-[firstCollectionView]-40-|", options: [], metrics: nil, views: layoutDict))
        
        // SECOND VIEW
        
        viewSecondDetails.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[lblSecondTitle(30)]-25-[lblsecondSubTitle(25)]-[secondCollectionView(125)]-20-[viewWallet(25)]-20-|", options: [], metrics: nil, views: layoutDict))
        
        lblSecondTitle.centerXAnchor.constraint(equalTo: viewSecondDetails.centerXAnchor).isActive = true
        
        lblsecondSubTitle.centerXAnchor.constraint(equalTo: viewSecondDetails.centerXAnchor).isActive = true
        
        viewSecondDetails.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-40-[secondCollectionView]-40-|", options: [], metrics: nil, views: layoutDict))
        
        // FIRST WALLET VIEW
        
        viewSecondDetails.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[viewWallet]-20-|", options: [], metrics: nil, views: layoutDict))
        
        viewWallet.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[lblWalletBalanceTitle(25)]|", options: [], metrics: nil, views: layoutDict))
        
        viewWallet.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[lblWalletBalance(25)]|", options: [], metrics: nil, views: layoutDict))
        
        viewWallet.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[lblAmount(25)]|", options: [], metrics: nil, views: layoutDict))
        
        viewWallet.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-2-[lblCheckBox(21)]-2-|", options: [], metrics: nil, views: layoutDict))
        
        viewWallet.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[lblWalletBalanceTitle]-10-[lblWalletBalance]", options: [.alignAllTop,.alignAllBottom], metrics: nil, views: layoutDict))
        
        viewWallet.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[lblAmount]-10-[lblCheckBox(21)]|", options: [], metrics: nil, views: layoutDict))
        
        // THIRD VIEW
        
        viewThirdDetails.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-15-[lblThirdTitle(25)]-15-[lblThirdSubTitle(25)]-15-[viewthirdSubTitles(25)]-10-[thirdCollectionView(100)]-10-[secondViewWallet(25)]-20-|", options: [], metrics: nil, views: layoutDict))
        
        lblThirdTitle.centerXAnchor.constraint(equalTo: viewThirdDetails.centerXAnchor).isActive = true
        
        lblThirdSubTitle.centerXAnchor.constraint(equalTo: viewThirdDetails.centerXAnchor).isActive = true
        
        viewThirdDetails.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-40-[thirdCollectionView]-40-|", options: [], metrics: nil, views: layoutDict))
        
        viewThirdDetails.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[secondViewWallet]-20-|", options: [], metrics: nil, views: layoutDict))
        
        // THIRD VIEW - SUBTITLES VIEW
        
        viewthirdSubTitles.centerXAnchor.constraint(equalTo: viewThirdDetails.centerXAnchor).isActive = true
        
        viewthirdSubTitles.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[lblThirdSubTitleOne(25)]|", options: [], metrics: nil, views: layoutDict))
        
        viewthirdSubTitles.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[lblThirdSubTitleTwo(25)]|", options: [], metrics: nil, views: layoutDict))
        
        viewthirdSubTitles.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[lblThirdSubTitleOne]-15-[lblThirdSubTitleTwo]|", options: [], metrics: nil, views: layoutDict))
        
        
        // THIRD VIEW - SECOND WALLET VIEW
        
        secondViewWallet.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[secondlblWalletBalanceTitle(25)]|", options: [], metrics: nil, views: layoutDict))
        
        secondViewWallet.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[secondlblWalletBalance(25)]|", options: [], metrics: nil, views: layoutDict))
        
        secondViewWallet.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[secondlblAmount(25)]|", options: [], metrics: nil, views: layoutDict))
        
        secondViewWallet.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-2-[secondlblCheckBox(21)]-2-|", options: [], metrics: nil, views: layoutDict))
        
        secondViewWallet.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[secondlblWalletBalanceTitle]-10-[secondlblWalletBalance]", options: [.alignAllTop,.alignAllBottom], metrics: nil, views: layoutDict))
        
        secondViewWallet.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[secondlblAmount]-10-[secondlblCheckBox(21)]|", options: [], metrics: nil, views: layoutDict))
        
    }
    
}
