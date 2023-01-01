//
//  SearchResultsViewController.swift
//  Netflix-Clone-MVVM
//
//  Created by Sergio on 1.01.23.
//

import UIKit

class SearchResultsViewController: UIViewController {

    public var titles: [Title] = [Title]()

    //MARK: - UIElements
    
    public let searchResultCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 3 - 10, height: 200)
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
        return collectionView
    }()

    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupHierarchy()
        delegat()
    }

    //MARK: - Setup
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchResultCollectionView.frame = view.bounds
    }

    func delegat() {
        searchResultCollectionView.delegate = self
        searchResultCollectionView.dataSource = self
    }

    func setupHierarchy() {
        view.addSubview(searchResultCollectionView)
    }
}

extension SearchResultsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        titles.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier, for: indexPath) as? TitleCollectionViewCell else {
            return UICollectionViewCell()
        }

        let title = titles[indexPath.row]
        cell.configure(with: title.poster_path ?? "")
        return cell
    }
}
