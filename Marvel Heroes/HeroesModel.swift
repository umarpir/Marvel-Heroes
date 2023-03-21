//
//  HeroesModel.swift
//  Marvel Heroes
//
//  Created by Umar Pirmahomed on 21/03/2023.
//

import Foundation

struct Response : Codable{
    var data: Data
}

struct Data: Codable{
    var results: Heroes
    
}

struct Heroes: Codable{
    var id: Int
    var name: String
}
