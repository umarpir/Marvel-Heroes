//
//  MarvelHeroesViewModel.swift
//  Marvel Heroes
//
//  Created by Umar Pirmahomed on 21/03/2023.
//

import Foundation


class MarvelHeroesViewModel: ObservableObject{
    @Published var response : [MarvelResult] = []
    private let urlString =  "https://gateway.marvel.com:443/v1/public/characters?ts=1&apikey=0c863702b0b77a585e4071cbc3593dea&hash=86d684bb2fb91e73c81cb7fc6b69d967"
    
    init() {
        Task {
           fetchHeroes()
        }
    }
    
    func fetchHeroes () {
        //create url
//        let urlString =  "https://gateway.marvel.com:443/v1/public/characters?ts=7&apikey=ba970a0b0d3f4db979adcb441a8f9b52&hash=38abe4e296ba8828ebfd47a5c9e62c6b"
//        if let url = URL(string: urlString ){
//            URLSession
//                .shared
//                .dataTask(with: url) {
//                    [weak self]data, response, error in
//
//                    if let error = error{
//                        //TODO: handle errors
//                        print(error)
//                    }else if let wrappedData = data {
////                        let decoder = JSONDecoder()
////                        if let data = data, let heroes = try? decoder.decode(Welcome.self, from: data) {
//////                            self?.response = heroes
////                            print(heroes)
////                        } else{
////
////                        }
//
//                        let decoder = JSONDecoder()
//
//                        do {
//                            let heroes = try decoder.decode(Welcome.self, from: wrappedData)
//                            print(heroes)
//                        } catch {
//                            print(error.localizedDescription)
//                        }
//                    }
//
//                }.resume()
//        }
        
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
}
