//
//  MarvelHeroesViewModel.swift
//  Marvel Heroes
//
//  Created by Umar Pirmahomed on 21/03/2023.
//

import Foundation
import CryptoKit

class MarvelHeroesViewModel: ObservableObject{
    @Published var results : [MarvelResult] = []
    private var publicKey: String = "0c863702b0b77a585e4071cbc3593dea"
    private var privateKey: String = "ff73168904c789744eca56e7c8dbca159776416c"
    
    init() {
        Task {
            fetchHeroes()
        }
    }
    
    func fetchHeroes () {
        var urlRequest = URLRequest(url: urlRequest()!)
        urlRequest.cachePolicy = .returnCacheDataElseLoad
            URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                if let data = data {
                    do {
                        let response = try JSONDecoder().decode(Welcome.self, from: data)
                        if let marvelResult = response.data?.results {
                            //print(marvelResult)
                            DispatchQueue.main.async {
                                self.results = marvelResult
                            }
                            
                        }
                    } catch let error {
                        print(error)
                    }
                }
            }.resume()
        
    }
    
    func returnDescription(hero : MarvelResult) -> String{
        if((hero.description!.count < 2)){
            return "Description not available"
        } else{
            return "Description \(hero.description ?? "N/A")"
        }
    }
    
    func urlRequest() -> URL?{
        let timeStamp = timeStamp()
        var api = "https://gateway.marvel.com:443/v1/public/characters?limit=50&ts=\(timeStamp)&apikey=\(publicKey)&hash="
        api.append(md5Generator(pubKey:publicKey, timeStamp: timeStamp, privKey: privateKey))
        let apiUrl = URL(string: api)
        return apiUrl
    }
    
    func timeStamp() -> Int{
        let someDate = Date().timeIntervalSince1970
        let timeStamp = Int(someDate)
        return timeStamp
    }
    
    func md5Generator(pubKey: String, timeStamp: Int, privKey: String) -> String{
        let md5 = "\(timeStamp)\(privKey)\(pubKey)"
        return md5.MD5
    }
    
}
