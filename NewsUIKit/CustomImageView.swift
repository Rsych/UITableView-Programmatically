//
//  CustomImageView.swift
//  NewsUIKit
//
//  Created by Ryan J. W. Kim on 2022/02/07.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

class CustomImageView: UIImageView {
    var task: URLSessionDataTask!
    let spinnerView = UIActivityIndicatorView(style: .medium)
    
    func loadImage(from url: URL) {
        image = nil
        addSpinner()
        
        // at beginning task is nil, so can't just be run.
        if let task = task {
            task.cancel()
        }
        
        if let imageFromCache = imageCache.object(forKey: url.absoluteString as AnyObject) as? UIImage {
            self.image = imageFromCache
            removeSpinner()
            return
        }
        
        task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard
                let data = data,
                let newImage = UIImage(data: data)
            else {
                print("Couldn't load image from url: \(url)")
                return
            }
            
            imageCache.setObject(newImage, forKey: url.absoluteString as AnyObject)
            
            DispatchQueue.main.async {
                self.image = newImage
                self.removeSpinner()
            }
        }
        task.resume()
    }
    
    func addSpinner() {
        addSubview(spinnerView)
        
        spinnerView.translatesAutoresizingMaskIntoConstraints = false
        spinnerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        spinnerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        spinnerView.startAnimating()
    }
    
    func removeSpinner() {
        spinnerView.removeFromSuperview()
    }
}
