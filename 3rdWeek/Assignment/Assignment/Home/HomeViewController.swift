//
//  HomeViewController.swift
//  Assignment
//
//  Created by 신지원 on 2023/08/03.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let rootView = HomeView()
    private let dummy = MyList.dummy()
    
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
        rootView.tabBarView.delegate = self
        rootView.tabBarView.dataSource = self
        rootView.contentView.delegate = self
        rootView.contentView.dataSource = self
    }
}

extension HomeViewController : UICollectionViewDelegate {
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        guard let layout = rootView.contentView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
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
        switch collectionView {
        case rootView.tabBarView :
            return 6
        case rootView.contentView :
            return 6
        default:
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case rootView.tabBarView :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeTabBarCell.cellIdentifier, for: indexPath) as? HomeTabBarCell else { return UICollectionViewCell() }
            cell.configureCell(dummy[indexPath.row])
            return cell
        case rootView.contentView :
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
                var fontSize = (dummy[indexPath.row].text.count) * 15 + 18 + 28
                return CGSize(width: fontSize, height: 27)
            }
            else {
                var fontSize = (dummy[indexPath.row].text.count) * 14 + 28
                return CGSize(width: fontSize, height: 27)
            }
        case rootView.contentView :
            return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        default:
            return CGSize.zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView {
        case rootView.tabBarView :
            return 28.0
        case rootView.contentView :
            return 0
        default:
            return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath.section), \(indexPath.row)")
    }
}
