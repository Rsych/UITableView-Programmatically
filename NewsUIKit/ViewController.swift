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
    var amiiboList = [Amiibo]()
    let url = URL(string: "https://amiiboapi.com/api/amiibo/")!
    
    override func viewDidLoad() {
        //        view.backgroundColor = .red
        safeArea = view.layoutMarginsGuide
        setupView()
        
        let anomyousFunction = { (fetchAmiiboList: [Amiibo]) in
            DispatchQueue.main.async {
                self.amiiboList = fetchAmiiboList
                self.tableView.reloadData()
                print(fetchAmiiboList.count)
            }
        }
        
        AmiiboAPI.shared.fetchAmiiboList(completion: anomyousFunction)
//        AmiiboAPI.shared.fetch(url, defaultValue: amiiboList, completion: anomyousFunction)
      
    }
    
    // MARK: - Setup View
    func setupView() {
        // Always add the UIView First before setting constraints
        view.addSubview(tableView)
        tableView.dataSource = self
        
        tableView.register(AmiiboCell.self, forCellReuseIdentifier: "cell")
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
        return amiiboList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let amiibo = amiiboList[indexPath.row]
        
        guard let amiiboCell = cell as? AmiiboCell else { return cell }
        
        amiiboCell.nameLabel.text = amiibo.name
        amiiboCell.gameSeriesLabel.text = amiibo.gameSeries
        return cell
    }
}
