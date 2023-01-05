//
//  ViewController.swift
//  Netflix-Clone-MVVM
//
//  Created by Sergio on 27.12.22.
//

import UIKit

final class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        setupTabBarController()
        setupTabBarViewControllers()
    }

    func setupTabBarController() {
        tabBar.tintColor = .label
    }

    func setupTabBarViewControllers() {
        let HomeViewController = UINavigationController(rootViewController: HomeViewController())
        HomeViewController.tabBarItem.image = UIImage(systemName: "house")
        HomeViewController.title = "Home"

        let UpcomingViewController = UINavigationController(rootViewController: UpcomingViewController())
        UpcomingViewController.tabBarItem.image = UIImage(systemName: "play.circle")
        UpcomingViewController.title = "Coming Soon"

        let SearchViewController = UINavigationController(rootViewController: SearchViewController())
        SearchViewController.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        SearchViewController.title = "Top Search"

        let DownloadsViewController = UINavigationController(rootViewController: DownloadsViewController())
        DownloadsViewController.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        DownloadsViewController.title = "Downloads"

        let controllers = [HomeViewController, UpcomingViewController, SearchViewController, DownloadsViewController]

        setViewControllers(controllers, animated: true)
    }
}
