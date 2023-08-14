//
//  HomeViewController.swift
//  Assignment
//
//  Created by 신지원 on 2023/08/03.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var direction = 0
    
    private let rootView = HomeView()
    
    private let dummy = MyList.dummy()
    private let dummyView = HomeContentView.dummyView()
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        target()
        delegate()
        
        setTabbar()
    }
    
    private func target() {
        
    }
    
    private func delegate() {
        rootView.tabBarView.delegate = self
        rootView.tabBarView.dataSource = self
        rootView.homeContentView.delegate = self
        rootView.homeContentView.dataSource = self
    }
    
    private func setTabbar() { // 처음을 Home으로 고정
        let firstIndexPath = IndexPath(item: 0, section: 0)
        rootView.tabBarView.selectItem(at: firstIndexPath, animated: false, scrollPosition: .right)
        rootView.homeContentView.selectItem(at: firstIndexPath, animated: false, scrollPosition: .right)
    }
}

extension HomeViewController : UICollectionViewDelegate {
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        //contentView 를 drag 할 때 tabBarView 이동
        if scrollView == rootView.homeContentView {
            let index = Int(targetContentOffset.pointee.x / rootView.homeContentView.frame.width)
            let indexPath = IndexPath(item: index, section: 0)
            
            rootView.tabBarView.selectItem(at: indexPath, animated: true, scrollPosition: .left)
            
            if direction > 0 {
                rootView.tabBarView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)}
            
            else {
                rootView.tabBarView.scrollToItem(at: indexPath, at: .left, animated: true)}
        }
    }
    
    //tabBar 눌렀을 때 contentView 이동
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == rootView.tabBarView {
            rootView.homeContentView.isPagingEnabled = false
            rootView.homeContentView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            rootView.homeContentView.isPagingEnabled = true
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let velocity = scrollView.panGestureRecognizer.velocity(in: scrollView)
        
        if velocity.x < 0 {
            direction = -1 }
        else if velocity.x > 0 {
            direction = 1 }
    }
}

extension HomeViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if dummy.count == dummyView.count {
            return dummy.count
        }
        else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case rootView.tabBarView :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeTabBarCell.cellIdentifier, for: indexPath) as? HomeTabBarCell else { return UICollectionViewCell() }
            cell.configureCell(dummy[indexPath.row])
            return cell
        case rootView.homeContentView :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell.cellIdentifier, for: indexPath) as? HomeCell else { return UICollectionViewCell() }
            cell.configureCell(dummyView[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}

extension HomeViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case rootView.tabBarView :
            if indexPath.row == 0 {
                let fontSize = (dummy[indexPath.row].text.count) * 15 + 18 + 28
                return CGSize(width: fontSize, height: 27)
            }
            else {
                let fontSize = (dummy[indexPath.row].text.count) * 14 + 28
                return CGSize(width: fontSize, height: 27)
            }
        case rootView.homeContentView :
            return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        default:
            return CGSize.zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView {
        case rootView.tabBarView :
            return 28.0
        case rootView.homeContentView :
            return 0
        default:
            return 0
        }
    }
}
