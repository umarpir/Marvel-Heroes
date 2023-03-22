//
//  HeroesView.swift
//  Marvel Heroes
//
//  Created by Umar Pirmahomed on 21/03/2023.
//

import SwiftUI

struct HeroView: View {
    @StateObject private var vm  = MarvelHeroesViewModel()
    let hero : MarvelResult
    
    var body: some View {
            VStack(alignment: .leading) {
                Text("Hero : \(hero.name ?? "N/A")")
                Divider()
                Text(vm.returnDescription(hero: hero))
        }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(Color.gray.opacity(0.1), in: RoundedRectangle(cornerRadius: 10, style: .continuous))
            .padding(.horizontal,4)
    }
}

struct HeroView_Previews: PreviewProvider {
    static var previews: some View {
        HeroView(hero: .init(id: 123, name: "gbkhjb", description: "hello hello", modified: "Date.now", thumbnail: Thumbnail(path: "", thumbnailExtension: nil), resourceURI: "sdf", comics: nil, series: nil, stories: nil, events: Comics(available: 12, collectionURI: "sdfd", items: nil, returned: 1), urls: nil))
    }
}

