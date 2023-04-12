//
//  FeedCell.swift
//  InstagramClone
//
//  Created by 박서원 on 2023/04/11.
//

import UIKit

class FeedCell : UICollectionViewCell {
    
    //MARK: - Properties
    
    // 👤 작성자 프로필
    private let profileImageView : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.image = #imageLiteral(resourceName: "venom-7")
        return iv
    }()
    
    // 🪪 작성자 이름 (버튼)
    // 초기화되기 전 아이템(타겟포함?) 추가 => lazy var로 선언
    private lazy var usernameButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("venom", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        button.addTarget(self, action: #selector(didTapUsername), for: .touchUpInside)
        return button
    }()

    // 🌅 게시물 이미지
    private let postImageView : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.image = #imageLiteral(resourceName: "venom-7")
        return iv
    }()
    
    // 🖤 좋아요 버튼
    private lazy var likeButton : UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "like_unselected") , for: .normal)
        button.tintColor = .black
        return button
    }()
    
    // 💬 댓글 버튼
    private lazy var commentButton : UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "comment") , for: .normal)
        button.tintColor = .black
        return button
    }()
    
    // 👥 공유 버튼
    private lazy var shareButton : UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "send2") , for: .normal)
        button.tintColor = .black
        return button
    }()
    
    // 🤍 좋아요 갯수
    private let likesLabel : UILabel = {
        let label = UILabel()
        label.text = "1 like"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
    // 🖊️ 작성자 및 내용
    private let captionLabel : UILabel = {
        let label = UILabel()
        label.text = "Some test caption for now..."
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    // 🕰️ 작성 일자
    private let postTimeLabel : UILabel = {
        let label = UILabel()
        label.text = "2 days ago"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        return label
    }()
    
    // 버튼 3개 담은 스택뷰
    private var stackView = UIStackView()
    // 속성 선언 이유: 함수에 작성 후 클래스 전체에서 액세스 해야 함!
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        // 프사
        addSubview(profileImageView)
        profileImageView.anchor(top: topAnchor, left: leftAnchor, paddingTop: 12, paddingLeft: 12)
        profileImageView.setDimensions(height: 40, width: 40)
        profileImageView.layer.cornerRadius = 40 / 2
        
        // 사용자 이름
        addSubview(usernameButton)
        usernameButton.centerY(inView: profileImageView, leftAnchor: profileImageView.rightAnchor, paddingLeft: 8)
        
        // 게시물 이미지
        addSubview(postImageView)
        postImageView.anchor(top: profileImageView.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 8)
        postImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        
        // 버튼들이 있는 스택뷰
        configureActionButtons()
        // 좋아요 갯수
        addSubview(likesLabel)
        likesLabel.anchor(top: likeButton.bottomAnchor, left: leftAnchor, paddingTop: -4, paddingLeft: 8)
        // 작성자 및 내용
        addSubview(captionLabel)
        captionLabel.anchor(top: likesLabel.bottomAnchor, left: leftAnchor, paddingTop: 8, paddingLeft: 8)
        // 작성 일시
        addSubview(postTimeLabel)
        postTimeLabel.anchor(top: captionLabel.bottomAnchor, left: leftAnchor, paddingTop: 8, paddingLeft: 8)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Actions
    
    @objc func didTapUsername() {
        
    }
    
    //MARK: - Helpers
    // 버튼 3개 -> 스택뷰 설정
    func configureActionButtons() {
        stackView = UIStackView(arrangedSubviews: [likeButton, commentButton, shareButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
        stackView.anchor(top: postImageView.bottomAnchor, width: 120, height: 50)
    }
}
