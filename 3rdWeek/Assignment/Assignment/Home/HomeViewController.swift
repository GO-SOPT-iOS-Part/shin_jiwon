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
    
}
extension HomeViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
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
