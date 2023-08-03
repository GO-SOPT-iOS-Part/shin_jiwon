//
//  HomeViewController.swift
//  Assignment
//
//  Created by 신지원 on 2023/08/03.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let rootView = HomeCollectionView()
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        target()
        delegate()
    }
    
    private func target() {
        
    }
    
    private func delegate() {
        rootView.delegate = self
        rootView.dataSource = self
    }
}

extension HomeViewController : UICollectionViewDelegate {
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        guard let layout = rootView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
        var roundedIndex = round(index)
        if scrollView.contentOffset.x > targetContentOffset.pointee.x {
            roundedIndex = floor(index)
        }
        else {
            roundedIndex = ceil(index)
        }
        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
        targetContentOffset.pointee = offset
    }
    
}
extension HomeViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch
        case home
        return 6
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell.cellIdentifier, for: indexPath) as? HomeCell else { return UICollectionViewCell() }
            return cell
        }
        else if indexPath.item == 1 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeLiveCell.cellIdentifier, for: indexPath) as? HomeLiveCell else { return UICollectionViewCell() }
            return cell
        }
        else if indexPath.item == 2 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeTVCell.cellIdentifier, for: indexPath) as? HomeTVCell else { return UICollectionViewCell() }
            return cell
        }
        else if indexPath.item == 3 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeMovieCell.cellIdentifier, for: indexPath) as? HomeMovieCell else { return UICollectionViewCell() }
            return cell
        }
        else if indexPath.item == 4 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeParaCell.cellIdentifier, for: indexPath) as? HomeParaCell else { return UICollectionViewCell() }
            return cell
        }
        else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeKidsCell.cellIdentifier, for: indexPath) as? HomeKidsCell else { return UICollectionViewCell() }
            return cell
        }
    }
}

extension HomeViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath.section), \(indexPath.row)")
    }
}
