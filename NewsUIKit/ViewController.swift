//
//  ViewController.swift
//  NewsUIKit
//
//  Created by Ryan J. W. Kim on 2022/02/06.
//

import UIKit

class NewsListVC: UIViewController {
    let tableView = UITableView()
    var safeArea: UILayoutGuide!
    let newsList = ["1", "2", "3", "4", "5", "6"]
    
    override func viewDidLoad() {
//        view.backgroundColor = .red
        safeArea = view.layoutMarginsGuide
        
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        setupView()
    }
    
    // MARK: - Setup View
    func setupView() {
        // Always add the UIView First before setting constraints
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

// MARK: - UITableViewDataSource

extension NewsListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let name = newsList[indexPath.row]
        
        cell.textLabel?.text = name
        return cell
    }
    
    
}
