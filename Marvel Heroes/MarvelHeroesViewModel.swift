//
//  MarvelHeroesViewModel.swift
//  Marvel Heroes
//
//  Created by Umar Pirmahomed on 21/03/2023.
//

import Foundation
import CryptoKit

class MarvelHeroesViewModel: ObservableObject{
    @Published var response : [MarvelResult] = []
    @Published var isPresented = false
    private var publicKey: String = "0c863702b0b77a585e4071cbc3593dea"
    private var privateKey: String = "ff73168904c789744eca56e7c8dbca159776416c"
    private let urlString =  "https://gateway.marvel.com:443/v1/public/characters?ts=1&apikey=0c863702b0b77a585e4071cbc3593dea&hash=86d684bb2fb91e73c81cb7fc6b69d967"
    
    init() {
        Task {
           fetchHeroes()
        }
    }
    
    func fetchHeroes () {
        if let url = URL(string: urlString) {
           URLSession.shared.dataTask(with: url) { data, response, error in
              if let data = data {
                  do {
                     let res = try JSONDecoder().decode(Welcome.self, from: data)
                      if let marvelResult = res.data?.results {
                          print(marvelResult)
                          DispatchQueue.main.async {
                              self.response = marvelResult
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
    
    func urlRequest() -> String{
        let timeStamp = timeStamp()
        let apiUrl = "https://gateway.marvel.com:443/v1/public/characters?&ts=\(timeStamp)1&apikey=\(publicKey)&hash=\(md5Generator(pubKey:publicKey, timeStamp: timeStamp, privKey: privateKey))"
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
