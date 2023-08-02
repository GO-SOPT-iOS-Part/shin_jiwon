//
//  MypageHeaderView.swift
//  Assignment
//
//  Created by 신지원 on 2023/08/02.
//

import UIKit

import SnapKit
import Then

protocol MypageHeaderViewDelegate: AnyObject {
}

class MypageHeaderView: UITableViewHeaderFooterView {
    
    weak var delegate: MypageHeaderViewDelegate?
    
    private let backButton = UIButton()
    private let alaramButton = UIButton()
    private let settingButton = UIButton()
    private let profileImageView = UIImageView()
    private let profileNameLabel = UILabel()
    private let profileChangeButton = UIButton()
    
    private let myTicketCashView = UIView()
    private let ticketImageView = UIImageView()
    private let ticketLabel = UILabel()
    private var myTicketLabel = UILabel()
    private let cashImageView = UIImageView()
    private let cashLabel = UILabel()
    private var myCashLabel = UILabel()
    
    let advertisementView = UIView()
    private let adTextLabel = UILabel()
    private let adTextLabel2 = UILabel()
    private let nextButton = UIButton()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        
        self.backgroundColor = .black
        
        self.addSubviews(backButton, alaramButton, settingButton,
                         profileImageView, profileNameLabel,profileChangeButton,
                         myTicketCashView, advertisementView )
        myTicketCashView.addSubviews(ticketImageView, ticketLabel, myTicketLabel, cashImageView, cashLabel, myCashLabel)
        advertisementView.addSubviews(adTextLabel,adTextLabel2,nextButton)
        
        backButton.do {
            $0.setImage(UIImage(named: "backBtn"), for: .normal)
        }
        
        alaramButton.do {
            $0.setImage(UIImage(named: "alaramBtn"), for: .normal)
            
        }
        settingButton.do {
            $0.setImage(UIImage(named: "settingBtn"), for: .normal)
            
        }
        profileImageView.do {
            $0.image = UIImage(named: "profileImage")
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 15
            
        }
        profileNameLabel.do {
            $0.text = "jiwon"
            $0.textColor = .white
            $0.font = UIFont(name: "Pretendard-Regular", size: 17)
        }
        
        profileChangeButton.do {
            $0.setTitle("프로필 전환", for: .normal)
            $0.setTitleColor(UIColor.tvingGray1, for: .normal)
            $0.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 10)
            $0.layer.borderColor = UIColor.tvingGray4.cgColor
            $0.layer.borderWidth = 1.0
            $0.layer.cornerRadius = 3.0
        }
        myTicketCashView.do {
            $0.backgroundColor = .tvingGray5
            $0.layer.cornerRadius = 3
            
            ticketImageView.do {
                $0.image = UIImage(named: "ticketImage")
            }
            ticketLabel.do {
                $0.text = "나의 이용권"
                $0.textColor = .tvingGray3
                $0.font = UIFont(name: "Pretendard-Regular", size: 13)
            }
            myTicketLabel.do {
                $0.text = "사용 중인 이용권이 없습니다."
                $0.textColor = .tvingGray3
                $0.font = UIFont(name: "Pretendard-Regular", size: 13)
            }
            cashImageView.do {
                $0.image = UIImage(named: "cashImage")
            }
            cashLabel.do {
                $0.text = "티빙캐시"
                $0.textColor = .tvingGray3
                $0.font = UIFont(name: "Pretendard-Regular", size: 13)
            }
            myCashLabel.do {
                $0.text = "0"
                $0.textColor = .white
                $0.font = UIFont(name: "Pretendard-Bold", size: 15)
            }
        }
        
        advertisementView.do {
            $0.backgroundColor = .tvingGray5
            $0.layer.cornerRadius = 3
            
            adTextLabel.do {
                let tvingImage = NSTextAttachment(image: UIImage(named: "tvNLogo") ?? UIImage())
                let jtbcImage = NSTextAttachment(image: UIImage(named: "jtbcLogo") ?? UIImage())
                let attributedString = NSMutableAttributedString()
                attributedString.append(NSAttributedString(string: "이용권을 구매하고  "))
                attributedString.append(NSAttributedString(attachment: tvingImage))
                attributedString.append(NSAttributedString(string: "  등 인기 TV프로그램과"))
                $0.attributedText = attributedString
                
                $0.textColor = .tvingGray2
                $0.font = UIFont(name: "Pretendard-Bold", size: 12)
            }
            adTextLabel2.do {
                $0.text = "다양한 영화 콘텐츠를 자유롭게 시청하세요!"
                $0.textColor = .tvingGray2
                $0.font = UIFont(name: "Pretendard-Bold", size: 12)
                
            }
            nextButton.do {
                $0.setImage(UIImage(named: "nextBtn"), for: .normal)
            }
        }
    }
    
    private func setLayout() {
        
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(24)
            $0.size.equalTo(15)
        }
        alaramButton.snp.makeConstraints {
            $0.centerY.equalTo(backButton.snp.centerY)
            $0.trailing.equalTo(settingButton.snp.leading).offset(-9)
            $0.size.equalTo(42)
        }
        settingButton.snp.makeConstraints {
            $0.centerY.equalTo(backButton.snp.centerY)
            $0.trailing.equalToSuperview().inset(25)
            $0.size.equalTo(33)
        }
        profileImageView.snp.makeConstraints {
            $0.top.equalTo(backButton.snp.bottom).offset(35)
            $0.leading.equalToSuperview().inset(24)
            $0.size.equalTo(72)
        }
        
        profileNameLabel.snp.makeConstraints {
            $0.centerY.equalTo(profileImageView.snp.centerY)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(22)
        }
        
        profileChangeButton.snp.makeConstraints {
            $0.centerY.equalTo(profileImageView.snp.centerY)
            $0.trailing.equalToSuperview().inset(23)
            $0.width.equalTo(70)
            $0.height.equalTo(25)
        }
        myTicketCashView.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(29)
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(10)
            $0.height.equalTo(92)
            
            ticketImageView.snp.makeConstraints {
                $0.top.equalToSuperview().inset(18)
                $0.leading.equalToSuperview().inset(11)
                $0.size.equalTo(23)
            }
            ticketLabel.snp.makeConstraints {
                $0.centerY.equalTo(ticketImageView.snp.centerY)
                $0.leading.equalTo(ticketImageView.snp.trailing).offset(5)
            }
            myTicketLabel.snp.makeConstraints {
                $0.centerY.equalTo(ticketLabel.snp.centerY)
                $0.trailing.equalToSuperview().inset(13)
                
            }
            cashImageView.snp.makeConstraints {
                $0.bottom.equalToSuperview().inset(11)
                $0.leading.equalTo(ticketImageView.snp.leading)
            }
            cashLabel.snp.makeConstraints {
                $0.centerY.equalTo(cashImageView.snp.centerY)
                $0.leading.equalTo(ticketLabel.snp.leading)
                
            }
            myCashLabel.snp.makeConstraints {
                $0.centerY.equalTo(cashLabel.snp.centerY)
                $0.trailing.equalTo(myTicketLabel.snp.trailing)
            }
        }
        advertisementView.snp.makeConstraints {
            $0.top.equalTo(myTicketCashView.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(10)
            $0.height.equalTo(60)
            
            adTextLabel.snp.makeConstraints {
                $0.top.equalToSuperview().inset(11)
                $0.leading.equalToSuperview().inset(18)
            }
            adTextLabel2.snp.makeConstraints {
                $0.top.equalTo(adTextLabel.snp.bottom).offset(8)
                $0.leading.equalTo(adTextLabel.snp.leading)
            }
            nextButton.snp.makeConstraints {
                $0.centerY.equalToSuperview()
                $0.trailing.equalToSuperview().inset(22)
                $0.size.equalTo(18)
            }
        }
    }
    
}
