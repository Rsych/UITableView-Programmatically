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
    
    override func viewDidLoad() {
        view.backgroundColor = .red
        safeArea = view.layoutMarginsGuide
        
        tableView.dataSource = self
        
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
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
