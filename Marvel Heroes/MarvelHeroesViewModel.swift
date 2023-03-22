//
//  MarvelHeroesViewModel.swift
//  Marvel Heroes
//
//  Created by Umar Pirmahomed on 21/03/2023.
//

import Foundation


class MarvelHeroesViewModel: ObservableObject{
    @Published var response : [MarvelResult] = []
    @Published var isPresented = false
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
}
