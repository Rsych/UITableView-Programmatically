//
//  AmiiboDetailVC.swift
//  NewsUIKit
//
//  Created by Ryan J. W. Kim on 2022/02/28.
//

import UIKit

class AmiiboDetailVC: UIViewController {
    var amiibo: AmiiboForView?
    
    var safeArea: UILayoutGuide!
    let imageIV = CustomImageView()
    let nameLabel = UILabel()
    let dismissButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        safeArea = view.layoutMarginsGuide
        
        setupImage()
        setupData()
        setupName()
        setupDismissButton()
    }
    
    func setupImage() {
        view.addSubview(imageIV)
        
        imageIV.translatesAutoresizingMaskIntoConstraints = false
        imageIV.contentMode = .scaleAspectFit
        imageIV.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageIV.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 50).isActive = true
        imageIV.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.5).isActive = true
        imageIV.heightAnchor.constraint(equalTo: imageIV.widthAnchor).isActive = true
    }
    
    func setupData() {
        if let amiibo = amiibo,
           let url = URL(string: amiibo.imageURL)
        {
            imageIV.loadImage(from: url)
            nameLabel.text = amiibo.name
        }
    }
    
    func setupName() {
        view.addSubview(nameLabel)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: imageIV.bottomAnchor, constant: 10).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        nameLabel.textColor = .white
    }
    
    func setupDismissButton() {
        view.addSubview(dismissButton)
        
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -50).isActive = true
        dismissButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        
        dismissButton.setTitle("Dismiss", for: .normal)
        
        dismissButton.addTarget(self, action: #selector(dismissAction), for: .touchUpInside)
    }
    
    @objc
    func dismissAction() {
        self.dismiss(animated: true)
    }
}
