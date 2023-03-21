//
//  MarvelHeroesViewModel.swift
//  Marvel Heroes
//
//  Created by Umar Pirmahomed on 21/03/2023.
//

import Foundation

class MarvelHeroesViewModel: ObservableObject{
    @Published var heroes : [Heroes] = []
    func fetchHeroes () async{
        //create url
        let urlString =  "https://gateway.marvel.com:443/v1/public/characters?ts=7&apikey=ba970a0b0d3f4db979adcb441a8f9b52&hash=38abe4e296ba8828ebfd47a5c9e62c6b"
        if let url = URL(string: urlString ){
            URLSession
                .shared
                .dataTask(with: url){
                    [weak self]data, response, error in
                    
                    if let error = error{
                        //TODO: handle errors
                    }else{
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        
                        if let data = data,
                           let heroes = try? decoder.decode([Heroes].self, from: data){
                            self?.heroes = heroes
                        } else{
                            
                        }
                    }
                    
                }.resume()
        }
    }
}
