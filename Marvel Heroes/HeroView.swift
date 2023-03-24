//
//  HeroesView.swift
//  Marvel Heroes
//
//  Created by Umar Pirmahomed on 21/03/2023.
//

import SwiftUI

struct HeroView: View {
    @StateObject private var vm  = MarvelHeroesViewModel()
    @StateObject var heroInfoVm = HeroInformationViewModel()
    let hero : MarvelResult
    
    var body: some View {
            HStack {
                AsyncImage(
                    url: heroInfoVm.comicPathBuilder(imageThumbnail: hero.thumbnail!),
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .clipShape(Circle())
                            .frame(width: 80,height: 80)

                    },
                    placeholder: {
                        ProgressView()
                    }
                )
                .padding()
                    .clipShape(Circle())
                VStack(alignment: .leading){
                    Text("Hero : \(hero.name ?? "N/A")")
                }
        }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(Color.gray.opacity(0.1), in: RoundedRectangle(cornerRadius: 10, style: .continuous))
            .padding(.horizontal,4)
    }
}

struct HeroView_Previews: PreviewProvider {
    static var previews: some View {
        HeroView(hero: .init(id: 123, name: "gbkhjb", description: "hello hello", modified: "Date.now", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73", thumbnailExtension: .jpg), resourceURI: "sdf", comics: nil, series: nil, stories: nil, events: Comics(available: 12, collectionURI: "sdfd", items: nil, returned: 1), urls: nil))
    }
}

