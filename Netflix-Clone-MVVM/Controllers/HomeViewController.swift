//
//  HomeViewController.swift
//  Netflix-Clone-MVVM
//
//  Created by Sergio on 27.12.22.
//

import UIKit

class HomeViewController: UIViewController {

    //MARK: - UIElements

    private let homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupHierarchy()
        setupLayout()
        delegate()
        headerTableView()
        configureNavBar()
    }

    //MARK: - Setup

    func delegate() {
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
    }

    private func configureNavBar() {
        var image = UIImage(named: "netflixLogo")
        image = image?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: image,
            style: .done,
            target: self,
            action: nil)

        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(
                image: UIImage(systemName: "person"),
                style: .done,
                target: self,
                action: nil),
            UIBarButtonItem(
                image: UIImage(systemName: "play.rectangle"),
                style: .done,
                target: self,
                action: nil)
        ]
        navigationController?.navigationBar.tintColor = .white
    }

    func headerTableView() {
        let headerView = HeroHeaderUIView(frame: CGRect(
            x: 0,
            y: 0,
            width: view.bounds.width,
            height: 450))
        homeFeedTable.tableHeaderView = headerView
    }

    func setupHierarchy() {
        view.addSubview(homeFeedTable)
    }

    func setupLayout() {
        NSLayoutConstraint.activate([
            homeFeedTable.topAnchor.constraint(equalTo: view.topAnchor),
            homeFeedTable.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            homeFeedTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeFeedTable.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

    //MARK: - UITableViewDataSource UITableViewDelegate

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        40
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset

        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
}
