//
//  UpcomingViewController.swift
//  Netflix-Clone-MVVM
//
//  Created by Sergio on 27.12.22.
//

import UIKit

class UpcomingViewController: UIViewController {

    private var titles: [Title] = [Title]()
    
    //MARK: - UIElements

    private let upcomingTable: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        delegate()
        setupHierarchy()
        //setupLayout()
        setupNavigationBar()
        fetchUpcoming()
    }
    
    //MARK: - Setup

    func setupNavigationBar() {
        title = "Upcoming"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
    }

    func delegate() {
        upcomingTable.delegate = self
        upcomingTable.dataSource = self
    }

    func setupHierarchy() {
        view.addSubview(upcomingTable)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        upcomingTable.frame = view.bounds
    }

    func setupLayout() {

    }

    private func fetchUpcoming() {
        APICaller.shared.getUpcomingMovies { [weak self] result in
            switch result {
            case .success(let titles):
                self?.titles = titles
                DispatchQueue.main.async {
                    self?.upcomingTable.reloadData()
                }
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

//MARK: - UITableViewDataSource, UITableViewDelegate

extension UpcomingViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        titles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = titles[indexPath.row].original_name ?? titles[indexPath.row].original_title ?? "Unknown"
        return cell
    }
}
