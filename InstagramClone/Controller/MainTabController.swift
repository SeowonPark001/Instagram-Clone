//
//  MainTabController.swift
//  InstagramClone
//
//  Created by 박서원 on 2023/04/11.
//

import UIKit

class MainTabController : UITabBarController {
    
    //MARK: - Lifecycle

    override func viewDidLoad() { // 한 번만 호출!
        super.viewDidLoad()
        
        configureViewControllers()
    }
    
    //MARK: - Helpers
    
    // 탭바 제어
    func configureViewControllers() {
        view.backgroundColor = .white
        
        let layout = UICollectionViewFlowLayout() // Flow!!!!
        
        let feed = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "home_unselected") , selectedImage: #imageLiteral(resourceName: "home_selected"), rootViewController: FeedController(collectionViewLayout: layout)) //FeedController()
        
        let search = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "search_unselected") , selectedImage: #imageLiteral(resourceName: "search_selected"), rootViewController: SearchController()) //SearchController()
        let imageSelector = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "plus_unselected") , selectedImage: #imageLiteral(resourceName: "plus_unselected"), rootViewController: ImageSelectorController()) // ImageSelectorController()
        let notifications = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "like_unselected") , selectedImage: #imageLiteral(resourceName: "like_selected"), rootViewController: NotificationController()) //NotificationController()
        let profile = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "profile_unselected") , selectedImage: #imageLiteral(resourceName: "profile_selected"), rootViewController: ProfileController()) //ProfileController()
        
        // 탭바 컨트롤러에 다른 컨트롤러 넣기
        viewControllers = [feed, search, imageSelector, notifications, profile]
        
        tabBar.tintColor = .black
    }
    
    // 네비게이션바 제어
    func templateNavigationController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage
        nav.navigationBar.tintColor = .black
        return nav
    }
}
