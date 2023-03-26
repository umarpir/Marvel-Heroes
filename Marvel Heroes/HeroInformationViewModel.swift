//
//  HeroInformationViewModel.swift
//  Marvel Heroes
//
//  Created by Umar Pirmahomed on 22/03/2023.
//

import Foundation
class HeroInformationViewModel: ObservableObject{
    var comicPath : String = ""

    func comicPathBuilder(imageThumbnail: Thumbnail) -> URL{
        
        let imageSize = "/detail."
        let imageExtention = "\(imageThumbnail.thumbnailExtension!)"
        comicPath = ("\(imageThumbnail.path!)\(imageSize)\(imageExtention)")
        comicPath = comicPath.replacingOccurrences(of: "http", with: "https")
        let url = URL(string: comicPath)
        let backUpUrl = URL(string: "https://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73/detail.jpg")
        return url ?? backUpUrl!
    }
    
    func returnDescription(hero : MarvelResult) -> String{
        if((hero.description!.count < 2)){
            return "Description not available"
        } else{
            return "Description \(hero.description ?? "N/A")"
        }
    }
}
