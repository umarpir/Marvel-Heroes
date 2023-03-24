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
    private var publicKey: String = "ba970a0b0d3f4db979adcb441a8f9b52"
    private var privateKey: String = "a3323a54c286349da868621e746a5d8c23bd81a3"
    
    init() {
        Task {
            fetchHeroes()
        }
    }
    
    func fetchHeroes () {
        if let url = urlRequest(){
            URLSession.shared.dataTask(with: url) { data, response, error in
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
