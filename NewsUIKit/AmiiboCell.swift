//
//  AmiiboCell.swift
//  NewsUIKit
//
//  Created by Ryan J. W. Kim on 2022/02/07.
//

import Foundation
import UIKit

class AmiiboCell: UITableViewCell {
    let imageV = UIImageView()
    var safeArea: UILayoutGuide!
    let nameLabel = UILabel()
    let gameSeriesLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    // if we used nib
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SetUp
    func setUpView() {
        safeArea = layoutMarginsGuide
        setUpImageView()
        setUpNameLabel()
        setUpGameSeriesLabel()
    }
    
    func setUpImageView() {
        addSubview(imageV)
        
        imageV.translatesAutoresizingMaskIntoConstraints = false
        imageV.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        imageV.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imageV.widthAnchor.constraint(equalToConstant: 44).isActive = true
        imageV.heightAnchor.constraint(equalToConstant: 44).isActive = true
        imageV.backgroundColor = .red
    }
    
    func setUpNameLabel() {
        addSubview(nameLabel)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: imageV.trailingAnchor, constant: 5).isActive = true
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        
        nameLabel.font = UIFont(name: "Verdana-Bold", size: 16)
    }
    
    func setUpGameSeriesLabel() {
        addSubview(gameSeriesLabel)
        
        gameSeriesLabel.translatesAutoresizingMaskIntoConstraints = false
        gameSeriesLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
        gameSeriesLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        
        gameSeriesLabel.font = UIFont(name: "Verdana", size: 12)
    }
}