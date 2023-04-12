//
//  FeedController.swift
//  InstagramClone
//
//  Created by 박서원 on 2023/04/11.
//

import UIKit

private let reuseIdentifier = "Cell"

class FeedController : UICollectionViewController {
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    //MARK: - Helpers
    
    func configureUI(){
        collectionView.backgroundColor = .white
        
        // 컬렉션뷰에 셀 등록
        collectionView.register(FeedCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

}

//MARK: - UI Collection View Data Source

extension FeedController {
    // 몇 개의 셀을 만들 것인지
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    // 각 셀을 어떻게 만들 것인지 - 식별자를 가진 셀 검색 후 캐시에서 가져옴
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FeedCell
        return cell
    }
}

//MARK: - UI Collection View Delegate Flow Layout

extension FeedController: UICollectionViewDelegateFlowLayout {
    // 셀 크기 조정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.frame.width
        var height = width + 8 + 40 + 8 // 8: 상하간격 // 40: 프사 크기
        height += 110 // 50: 게시물 이미지 // 60: 아래 좋아요~작성일시 칸
        
        //return CGSize(width: view.frame.width, height: 200)
        return CGSize(width: width, height: height)
    }
}
