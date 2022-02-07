//
//  AmiiboAPI.swift
//  NewsUIKit
//
//  Created by Ryan J. W. Kim on 2022/02/06.
//

import Foundation
import Combine

final class AmiiboAPI {
    static let shared = AmiiboAPI()
    private var anyCancellable = Set<AnyCancellable>()
    
    func fetch<T: Decodable>(_ url: URL, defaultValue: T, completion: @escaping (T) -> Void) {
        let decoder = JSONDecoder()
        URLSession.shared.dataTaskPublisher(for: url)
            .retry(1)
            .map(\.data)
            .decode(type: T.self, decoder: decoder)
            .replaceError(with: defaultValue)
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: completion)
            .store(in: &anyCancellable)
    }
    
    // @escaping means that don't terminate the function life time until the @escaping closure has finished execution in the opposite of nonEscaping closure the function can be terminated before the closure finishes execution Ex:
    func fetchAmiiboList(completion: @escaping ([Amiibo]) -> ()) {
        let url = URL(string: "https://amiiboapi.com/api/amiibo/")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                fatalError(error?.localizedDescription ?? "Data was nil")
            }
            guard let amiiboList = try? JSONDecoder().decode(AmiiboLists.self, from: data) else {
                fatalError(error?.localizedDescription ?? "Couldn't decode json")
            }
            completion(amiiboList.amiibo)
        }
        task.resume()
    }
}

// MARK: - Amiibo
struct AmiiboLists: Codable {
    let amiibo: [Amiibo]
}

// MARK: - Amiibo
struct Amiibo: Codable {
    let amiiboSeries, character, gameSeries, head: String
    let image: String
    let name: String
    let release: Release?
    let tail, type: String
}

// MARK: - Release
struct Release: Codable {
    let au, eu, jp, na: String?
}
/*
 {
 "amiibo": [
 {
 "amiiboSeries": "Super Smash Bros.",
 "character": "Mario",
 "gameSeries": "Super Mario",
 "head": "00000000",
 "image": "https://raw.githubusercontent.com/N3evin/AmiiboAPI/master/images/icon_00000000-00000002.png",
 "name": "Mario",
 "release": {
 "au": "2014-11-29",
 "eu": "2014-11-28",
 "jp": "2014-12-06",
 "na": "2014-11-21"
 },
 "tail": "00000002",
 "type": "Figure"
 },
 {
 "amiiboSeries": "Super Mario Bros.",
 "character": "Mario",
 "gameSeries": "Super Mario",
 "head": "00000000",
 "image": "https://raw.githubusercontent.com/N3evin/AmiiboAPI/master/images/icon_00000000-00340102.png",
 "name": "Mario",
 "release": {
 "au": "2015-03-21",
 "eu": "2015-03-20",
 "jp": "2015-03-12",
 "na": "2015-03-20"
 },
 "tail": "00340102",
 "type": "Figure"
 }
 ]
 }
 */
