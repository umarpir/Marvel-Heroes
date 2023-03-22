//
//  HeroInformationView.swift
//  Marvel Heroes
//
//  Created by Umar Pirmahomed on 22/03/2023.
//

import SwiftUI

struct HeroInformationView: View {
    let hero : MarvelResult
    var body: some View {
        Text("\(hero.name ?? "sajbdk")")
        Text("\(hero.thumbnail?.path ?? "sajbdk")")
    }
}

struct HeroInformationView_Previews: PreviewProvider {
    static var previews: some View {
        HeroInformationView(hero: .init(id: 123, name: "Spider-Man", description: "hello hello", modified: "Date.now", thumbnail: Thumbnail(path: "", thumbnailExtension: nil), resourceURI: "sdf", comics: nil, series: nil, stories: nil, events: Comics(available: 12, collectionURI: "sdfd", items: nil, returned: 1), urls: nil))
    }
}
