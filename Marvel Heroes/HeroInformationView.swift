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
        NavigationStack {
            VStack{
                Spacer(minLength: 180)
                List{
                    Text("Name: \(hero.name!)")
                    Text(heroInfoVm.returnDescription(hero: hero))

                    Text("Comics").font(.largeTitle)
                    ForEach((hero.comics?.items!)!, id: \.self) { comic in
                            ComicsView(comic: comic)
                        
                    }
                }

            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Spacer(minLength: 170)
                        VStack {
                            AsyncImage(
                                url: heroInfoVm.comicPathBuilder(imageThumbnail: hero.thumbnail!),
                                content: { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        .frame(width: 150,height: 150)
                                        .clipShape(Circle())
                                },
                                placeholder: {
                                    ProgressView()
                                }
                            )
                                
                            Text("  \(hero.name!)")
                                .font(.largeTitle)
                                .multilineTextAlignment(.center)
                        }
                    }
                }
                
            }
        }
    }
}

struct HeroInformationView_Previews: PreviewProvider {
    static var itemo : [ComicsItem] = [ComicsItem(resourceURI: "sdf", name: "asdasf")]
    static var previews: some View {
        HeroInformationView(hero: .init(id: 123, name: "Spider-Man", description: "hello hello", modified: "Date.now", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73", thumbnailExtension: .jpg), resourceURI: "sdf", comics: Comics(available: 12, collectionURI: "asjdhvasjkh.com", items: itemo, returned: 12), series: nil, stories: nil, events: Comics(available: 12, collectionURI: "sdfd", items: nil, returned: 1), urls: nil))
    }
}
