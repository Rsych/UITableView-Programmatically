//
//  AmiiboServices.swift
//  NewsUIKit
//
//  Created by Ryan J. W. Kim on 2022/02/06.
//

import Foundation
import Combine

class AmiiboDataService {
    @Published var amiibo: [Amiibo] = []
    //    // it would be too confusing which to cancellable
    //    var cancellables = Set<AnyCancellable>()
    
    var subscription: AnyCancellable?
    
    init() {
        getAmiibos()
    }
    func getAmiibos() {
        guard let url = URL(string: "https://amiiboapi.com/api/amiibo/") else { return }
        
        subscription = NetworkManager.download(url: url)
            .decode(type: [Amiibo].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] (returnedAmiibo) in
                self?.amiibo = returnedAmiibo
                self?.subscription?.cancel()
            })
    }
}

