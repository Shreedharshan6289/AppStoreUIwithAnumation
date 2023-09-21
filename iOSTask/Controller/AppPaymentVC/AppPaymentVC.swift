//
//  AppPaymentVC.swift
//  iOSTask
//
//  Created by Shreedharshan on 21/09/23.
//

import UIKit

class AppPaymentVC: UIViewController {
    
    var appPaymentView = AppPaymentView()
    
    var isFirstViewShown = false
    var isSecondViewShown = false
    var isThirdViewShown = false
    
    var numArray = ["5","10","15"]
    var selectedNum: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupTargets()
        setupData()
        setupCollectionViews()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        initialAnimations()
    }
    
    func setupViews() {
        self.appPaymentView.setupViews(self.view)
        self.isFirstViewShown = true
    }
    
    func setupTargets() {
        self.appPaymentView.btnNext.addTarget(self, action: #selector(nextBtnAction(_ :)), for: .touchUpInside)
    }
    
    func setupData() {
        self.selectedNum = numArray.first
        self.appPaymentView.secondCollectionView.reloadData()
    }
    
    func initialAnimations() {
        self.appPaymentView.bgView.animateShowView(0.1)
        self.appPaymentView.lblFirstTitle.zoomToOriginalForm()
        self.appPaymentView.firstCollectionView.animateViewFromLeftToRight(vc:self)
    }
    
    func setupCollectionViews() {
        
        self.appPaymentView.firstCollectionView.delegate = self
        self.appPaymentView.firstCollectionView.dataSource = self
        self.appPaymentView.firstCollectionView.register(FirstCollectionViewCell.self, forCellWithReuseIdentifier: "FirstCollectionViewCell")
        
        self.appPaymentView.secondCollectionView.delegate = self
        self.appPaymentView.secondCollectionView.dataSource = self
        self.appPaymentView.secondCollectionView.register(SecondCollectionViewCell.self, forCellWithReuseIdentifier: "SecondCollectionViewCell")
        
        self.appPaymentView.thirdCollectionView.delegate = self
        self.appPaymentView.thirdCollectionView.dataSource = self
        self.appPaymentView.thirdCollectionView.register(ThirdCollectionViewCell.self, forCellWithReuseIdentifier: "ThirdCollectionViewCell")
        
    }
    
}

//MARK: OBJC FUNCTIONS

extension AppPaymentVC {
    
    @objc func nextBtnAction(_ sender: UIButton) {
        
        if isThirdViewShown {
            self.dismiss(animated: true)
            
        } else if isSecondViewShown {
            
            self.appPaymentView.viewSecondDetails.isHidden = true
            self.appPaymentView.viewThirdDetails.isHidden = false
            self.appPaymentView.lblThirdTitle.zoomToOriginalForm(0.6)
            self.appPaymentView.lblThirdSubTitle.zoomToOriginalForm(0.6)
            self.appPaymentView.thirdCollectionView.animateViewFromLeftToRight(0.6,vc:self)
            
            self.appPaymentView.btnNext.setTitle("Confirm".uppercased(),for: .normal)
            self.appPaymentView.btnNext.backgroundColor = .darkGray
            self.appPaymentView.btnNext.animateShowView(0.6)
            
            self.appPaymentView.viewthirdSubTitles.animateViewFromTopToBottom(0.6)
            self.appPaymentView.secondViewWallet.animateViewFromTopToBottom(0.6)
            isThirdViewShown = true
            
            
        } else if isFirstViewShown {
            
            self.appPaymentView.viewFirstDetails.isHidden = true
            self.appPaymentView.viewSecondDetails.isHidden = false
            self.appPaymentView.lblSecondTitle.zoomToOriginalForm()
            self.appPaymentView.secondCollectionView.animateViewFromLeftToRight(vc:self)
            self.appPaymentView.viewWallet.animateViewFromTopToBottomSecMethod(0.6)
            self.isSecondViewShown = true
        }
    }
    
}

//MARK: COLLECTIONVIEW DELEGATE AND DATASOURCE

extension AppPaymentVC: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.appPaymentView.firstCollectionView {
            
            return 2
            
        } else if collectionView == self.appPaymentView.secondCollectionView {
            
            return numArray.count
            
        } else if collectionView == self.appPaymentView.thirdCollectionView {
            
            return 3
            
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.appPaymentView.firstCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstCollectionViewCell", for: indexPath) as? FirstCollectionViewCell ?? FirstCollectionViewCell()
            
            return cell
            
        } else if collectionView == self.appPaymentView.secondCollectionView {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondCollectionViewCell", for: indexPath) as? SecondCollectionViewCell ?? SecondCollectionViewCell()
            cell.numLbl.text = numArray[indexPath.row]
            
            if selectedNum == numArray[indexPath.row] {
                cell.numLbl.backgroundColor = .systemGreen
            } else {
                cell.numLbl.backgroundColor = .systemGray.withAlphaComponent(0.7)
            }
            
            return cell
            
        } else if collectionView == self.appPaymentView.thirdCollectionView {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThirdCollectionViewCell", for: indexPath) as? ThirdCollectionViewCell ?? ThirdCollectionViewCell()
            
            return cell
            
        }
        
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == self.appPaymentView.firstCollectionView {
            
            let width = (UIScreen.main.bounds.width-25)/2.5
            let height = CGFloat(210)
            return CGSize(width: width, height: height)
            
        } else if collectionView == self.appPaymentView.secondCollectionView {
            
            let width = (UIScreen.main.bounds.width-25)/4.5
            let height = CGFloat(100)
            return CGSize(width: width, height: height)
            
        } else if collectionView == self.appPaymentView.thirdCollectionView {
            
            let width = (UIScreen.main.bounds.width-25)/4.5
            let height = CGFloat(100)
            return CGSize(width: width, height: height)
            
        }
        
        return CGSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.appPaymentView.secondCollectionView {
            self.selectedNum = numArray[indexPath.row]
            self.appPaymentView.secondCollectionView.reloadData()
        }
    }
    
}


//MARK: DISMISS ON SCREEN TOUCH

extension AppPaymentVC {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, touch.view == self.appPaymentView.bgView {
            self.dismiss(animated: true)
        }
    }
    
}
