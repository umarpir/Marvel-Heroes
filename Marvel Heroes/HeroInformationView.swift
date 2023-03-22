//
//  HeroInformationView.swift
//  Marvel Heroes
//
//  Created by Umar Pirmahomed on 22/03/2023.
//

import SwiftUI

struct HeroInformationView: View {
    let hero : MarvelResult
    @StateObject var heroInfoVm = HeroInformationViewModel()
    @State private var currentComic: ComicsItem = ComicsItem(resourceURI: "", name: "Comic")
    var comics : [ComicsItem] = []
    var body: some View {
        NavigationView {
            VStack{
                Spacer(minLength: 100)
                List{
                    Text("Name: \(hero.name!)")
                    Text(heroInfoVm.returnDescription(hero: hero))
                    Picker("Comics", selection: $currentComic){
                        ForEach(hero.comics?.items ?? comics, id: \.self){ comic in
                            Text(comic.name!)
                        }.pickerStyle(.navigationLink)
                    }.id(UUID())
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text(" ").font(.largeTitle)
                        HStack {
                            AsyncImage(
                                url: heroInfoVm.comicPathBuilder(imageThumbnail: hero.thumbnail!),
                                content: { image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                },
                                placeholder: {
                                    ProgressView()
                                }
                            )
                                .frame(width: 120,height: 120)
                                .clipShape(Circle())
                            Text("  \(hero.name!)")
                                .font(.title)
                        }
                    }
                }
                
            }
        }
    }
}

struct HeroInformationView_Previews: PreviewProvider {
    static var previews: some View {
        HeroInformationView(hero: .init(id: 123, name: "Spider-Man", description: "hello hello", modified: "Date.now", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73", thumbnailExtension: .jpg), resourceURI: "sdf", comics: nil, series: nil, stories: nil, events: Comics(available: 12, collectionURI: "sdfd", items: nil, returned: 1), urls: nil))
    }
}
