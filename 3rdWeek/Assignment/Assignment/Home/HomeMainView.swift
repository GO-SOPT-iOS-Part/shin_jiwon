//
//  HomeContentVIew.swift
//  Assignment
//
//  Created by 신지원 on 2023/08/08.
//

import UIKit

import SnapKit
import Then

class HomeMainView: UIView {
    
    // MARK: - UI Components
    
    public lazy var mainScrollView = UIScrollView()
    public lazy var firstCollectionView = FirstCollectionView()
    
    private var secondLabel = UILabel()
    public lazy var secondCollectionView = SecondCollectionView()
    
    private var thirdLabel = UILabel()
    public lazy var thirdCollectionView = ThirdCollectionView()
    
    private var fourthLabel = UILabel()
    public lazy var fourthCollectionView = FourthCollectionView()
    
    private let dummyColor = MyContentView.dummy()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        delegate()
        
        setStyle()
        setLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Method
    private func delegate() {
        
        firstCollectionView.delegate = self
        firstCollectionView.dataSource = self
        secondCollectionView.delegate = self
        secondCollectionView.dataSource = self
        thirdCollectionView.delegate = self
        thirdCollectionView.dataSource = self
        fourthCollectionView.delegate = self
        fourthCollectionView.dataSource = self
        
    }
    
    private func setStyle() {
        
        self.backgroundColor = .black
        self.addSubview(mainScrollView)
        mainScrollView.addSubviews(firstCollectionView,
                                   secondLabel, secondCollectionView,
                                   thirdLabel, thirdCollectionView,
                                   fourthLabel, fourthCollectionView)
        
        mainScrollView.do {
            $0.showsVerticalScrollIndicator = false
        }
        
        secondLabel.do {
            $0.text = "티빙에서 꼭 봐야하는 콘텐츠"
            $0.textColor = .white
            $0.font = UIFont(name: "Pretendard-Bold", size: 15)
        }
        
        thirdLabel.do {
            $0.text = "인기 LIVE 채널"
            $0.textColor = .white
            $0.font = UIFont(name: "Pretendard-Bold", size: 15)
        }
        
        fourthLabel.do {
            $0.text = "여기는 광고"
            $0.textColor = .white
            $0.font = UIFont(name: "Pretendard-Bold", size: 15)
        }
    }
    
    private func setLayout() {
        
        mainScrollView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalToSuperview()
            $0.bottom.equalToSuperview()
            
            firstCollectionView.snp.makeConstraints {
                $0.top.equalToSuperview()
                $0.width.equalToSuperview()
                $0.height.equalTo(498)
            }
            
            secondLabel.snp.makeConstraints {
                $0.top.equalTo(firstCollectionView.snp.bottom).offset(49)
                $0.leading.equalToSuperview().inset(15)
            }
            
            secondCollectionView.snp.makeConstraints {
                $0.top.equalTo(secondLabel.snp.bottom).offset(14)
                $0.width.equalToSuperview()
                $0.height.equalTo(146)
            }
            
            thirdLabel.snp.makeConstraints() {
                $0.top.equalTo(secondCollectionView.snp.bottom).offset(30)
                $0.leading.equalToSuperview().inset(15)
            }
            
            thirdCollectionView.snp.makeConstraints {
                $0.top.equalTo(thirdLabel.snp.bottom).offset(14)
                $0.width.equalToSuperview()
                $0.height.equalTo(80)
            }
            
            fourthLabel.snp.makeConstraints() {
                $0.top.equalTo(thirdCollectionView.snp.bottom).offset(30)
                $0.leading.equalToSuperview().inset(15)
            }
            
            fourthCollectionView.snp.makeConstraints {
                $0.top.equalTo(fourthLabel.snp.bottom).offset(14)
                $0.width.equalToSuperview()
                $0.height.equalTo(58)
                $0.bottom.equalToSuperview().inset(50)
            }
        }
    }
}

extension HomeMainView : UICollectionViewDelegate {
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        guard let layout = firstCollectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        let cellWidthIncludingSpacing = layout.itemSize.width
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

extension HomeMainView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dummyColor.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case firstCollectionView :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstCell.cellIdentifier, for: indexPath) as? FirstCell else { return UICollectionViewCell() }
            cell.configureCell(dummyColor[indexPath.row])
            return cell
            
        case secondCollectionView :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SecondCell.cellIdentifier, for: indexPath) as? SecondCell else { return UICollectionViewCell() }
            cell.configureCell(dummyColor[indexPath.row])
            return cell
            
        case thirdCollectionView :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThirdCell.cellIdentifier, for: indexPath) as? ThirdCell else { return UICollectionViewCell() }
            cell.configureCell(dummyColor[indexPath.row])
            return cell
            
        case fourthCollectionView :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FourthCell.cellIdentifier, for: indexPath) as? FourthCell else { return UICollectionViewCell() }
            cell.configureCell(dummyColor[indexPath.row])
            return cell
            
        default:
            return UICollectionViewCell()
        }
    }
}

extension HomeMainView : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView {
        case firstCollectionView :
            return 0.0
            
        case secondCollectionView :
            return 10.0
            
        case thirdCollectionView :
            return 7.0
            
        case fourthCollectionView :
            return 7.0
            
        default:
            return 0.0
        }
    }
}

