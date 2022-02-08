//
//  AmiiboCell.swift
//  NewsUIKit
//
//  Created by Ryan J. W. Kim on 2022/02/07.
//

import Foundation
import UIKit

class AmiiboCell: UITableViewCell {
    let imageV = CustomImageView()
    var safeArea: UILayoutGuide!
    let nameLabel = UILabel()
    let gameSeriesLabel = UILabel()
    let owningCountLabel = UILabel()
    
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
        setUpOwningCountLabel()
        setUpImageView()
        setUpNameLabel()
        setUpGameSeriesLabel()
    }
    
    func setUpImageView() {
        addSubview(imageV)
        
        imageV.contentMode = .scaleAspectFit
        imageV.translatesAutoresizingMaskIntoConstraints = false
        imageV.leadingAnchor.constraint(equalTo: owningCountLabel.trailingAnchor, constant: 5).isActive = true
        imageV.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imageV.widthAnchor.constraint(equalToConstant: 44).isActive = true
        imageV.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
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
    
    func setUpOwningCountLabel() {
        addSubview(owningCountLabel)
        
        owningCountLabel.translatesAutoresizingMaskIntoConstraints = false
        owningCountLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        owningCountLabel.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor).isActive = true
        
    }
}
