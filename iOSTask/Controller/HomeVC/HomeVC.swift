//
//  HomeVC.swift
//  iOSTask
//
//  Created by Shreedharshan on 19/09/23.
//

import UIKit
import Loady


class HomeVC: UIViewController {
    
    var homeView = HomeView()
    
    var currentIndexPath = IndexPath()
    var apps = ["Insta","FB","WP","SnapChat","Twitter"]
    var firstApp = String()
    
    var tempTimer1 : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupViews()
        self.setupTargets()
        self.setupData()
        self.setupTableView()
        self.setupCollectionView()
        
    }
    
    func setupViews() {
        self.homeView.setupViews(self.view)
    }
    
    func setupTargets() {
        
        let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(scrollDirection(_:)))
        upSwipe.direction = .up
        self.homeView.tblAppList.addGestureRecognizer(upSwipe)
        
        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(scrollDirection(_:)))
        downSwipe.direction = .down
        self.homeView.tblAppList.addGestureRecognizer(downSwipe)
        
        self.homeView.btnClose.addTarget(self, action: #selector(closeBtnAction(_ :)), for: .touchUpInside)
        
        self.homeView.btnDownload.addTarget(self, action: #selector(downloadBtnAction(_ :)), for: .touchUpInside)
        
        self.homeView.btnCancelDownload.addTarget(self, action: #selector(cancelDownloadAction(_ :)), for: .touchUpInside)
        
        self.homeView.btnPlay.addTarget(self, action: #selector(playBtnAction(_ :)), for: .touchUpInside)
        
    }
    
    func setupData() {
        firstApp = apps.first!
    }
    
    
    func setupTableView() {
        
        self.homeView.tblAppList.delegate = self
        self.homeView.tblAppList.dataSource = self
        self.homeView.tblAppList.register(AppTableViewCell.self, forCellReuseIdentifier: "AppTableViewCell")
        
    }
    
    func setupCollectionView() {
        
        self.homeView.screenShotsCollectionView.delegate = self
        self.homeView.screenShotsCollectionView.dataSource = self
        self.homeView.screenShotsCollectionView.register(AppScreenshortsCell.self, forCellWithReuseIdentifier: "AppScreenshortsCell")
        self.homeView.screenShotsCollectionView.reloadData()
        
    }
}

//MARK: OBJC FUNCTIONS

extension HomeVC {
    
    @objc func scrollDirection(_ sender: UISwipeGestureRecognizer) {
        if (sender.direction == .up) {
            let removed = apps.remove(at: 0)
            self.apps.append(removed)
            self.homeView.tblAppList.reloadData()
            
            self.homeView.tblAppList.layer.add(self.swipeTransition(true, direction: .fromTop) ,forKey: nil)
            self.homeView.tblAppList.layoutSubviews()
            self.homeView.tblAppList.reloadData()
            
        } else if (sender.direction == .down) {
            
            let removed = apps.remove(at: apps.count - 1)
            self.apps.insert(removed, at: 0)
            self.homeView.tblAppList.reloadData()
            
            self.homeView.tblAppList.layer.add(self.swipeTransition(true, direction: .fromBottom), forKey: nil)
            self.homeView.tblAppList.layoutSubviews()
            self.homeView.tblAppList.reloadData()
            
        }
    }
    
    func swipeTransition(_ scroll: Bool,direction: CATransitionSubtype) -> CATransition {
        let transition = CATransition()
        transition.startProgress = 0.0
        transition.endProgress = 1.0
        transition.type = CATransitionType.push
        transition.subtype = direction
        transition.duration = 0.5
        return transition
    }
    
    @objc func closeBtnAction(_ sender: UIButton) {
        
        self.homeView.containerView.isHidden = true
        self.homeView.btnClose.isHidden = true
        self.homeView.lblAppDiscription.isHidden = true
        self.homeView.btnReadMore.isHidden = true
        self.homeView.btnPlay.isHidden = true
        
        self.homeView.tblAppList.isHidden = false
        self.homeView.stackDownload.isHidden = false
        self.homeView.stackDownload.alpha = 1
        self.homeView.btnDownload.setTitle("Download \n 30 MB".uppercased(), for: .normal)
        self.homeView.btnDownload.backgroundColor = .systemGreen
        self.homeView.btnCancelDownload.fadeAnimateView()
        
        self.animateDownload(sender, stopLoading: true)
        
    }
    
    @objc func downloadBtnAction(_ sender: UIButton) {
        
        self.homeView.btnDownload.backgroundColor = .systemGreen.withAlphaComponent(0.4)
        self.animateDownload(sender, stopLoading: false)
        self.homeView.btnCancelDownload.animateViewFromLeftToRight(vc: self)
        
    }
    
    @objc func cancelDownloadAction(_ sender: UIButton) {
        
        self.animateDownload(sender, stopLoading: true)
        self.homeView.btnDownload.setTitle("Download \n 30 MB".uppercased(), for: .normal)
        self.homeView.btnDownload.backgroundColor = .systemGreen
        self.homeView.btnCancelDownload.fadeAnimateView()
        
    }
    
    @objc func playBtnAction(_ sender: UIButton) {
        self.homeView.btnPlay.flashAView(false)
        let vc = AppPaymentVC()
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true, completion: nil)
        
    }
    
}


//MARK: TABLEVIEW DELEGATE AND DATASOURCE

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AppTableViewCell", for: indexPath) as? AppTableViewCell ?? AppTableViewCell()
        
        currentIndexPath = indexPath
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.homeView.tblAppList.isHidden = true
        self.homeView.containerView.isHidden = false
        
        UIView.animate(withDuration: 1) {
            
            self.homeView.containerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
            self.homeView.containerView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
            
            self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[containerView]|", metrics: nil, views: self.homeView.layoutDict))
            self.homeView.containerView.layoutIfNeeded()
        } completion: { done in
            self.homeView.lblAppDiscription.animateShowView()
            self.homeView.btnReadMore.animateShowView()
            self.homeView.btnClose.animateShowView()
            self.homeView.screenShotsCollectionView.animateViewFromLeftToRight(vc:self)
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let height = AppConstants.screeenHeight * 0.7
        
        return height
    }
}


//MARK: COLLECTIONVIEW DELEGATE AND DATASOURCE

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AppScreenshortsCell", for: indexPath) as? AppScreenshortsCell ?? AppScreenshortsCell()
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (UIScreen.main.bounds.width-25)/2
        let height = self.homeView.screenShotsCollectionView.bounds.size.height * 2
        return CGSize(width: width, height: height)
    }
    
}

// MARK: ANIMATE DOWNLOAD

extension HomeVC {
    
    func animateDownload(_ sender: UIButton,stopLoading: Bool) {
        
        self.homeView.btnDownload.setTitle("10/30 MB", for: .normal)
        
        guard let button = sender as? LoadyButton else {
            return
        }
        if stopLoading {
            if button.loadingIsShowing() {
                button.stopLoading()
                self.tempTimer1?.invalidate()
                return
            }
        } else {
            button.startLoading()
            var percent : CGFloat = 0
            switch button.animationType {
            case LoadyBackgroundHighlighterAnimation.animationTypeKey:
                self.tempTimer1?.invalidate()
                self.tempTimer1 = nil
                
                self.tempTimer1 = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (t) in
                    percent += CGFloat.random(in: 0...10)
                    button.update(percent: percent)
                    if percent > 105 {
                        percent = 100
                        self.tempTimer1?.invalidate()
                        self.homeView.stackDownload.fadeAnimateView()
                        self.homeView.btnPlay.animateViewFromBottomToTop(vc: self)
                        self.homeView.btnPlay.flashAView(true)
                    }
                }
                
                self.tempTimer1?.fire()
                
            default:
                break;
            }
        }
        
    }
    
}
