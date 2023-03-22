//
//  HeroInformationView.swift
//  Marvel Heroes
//
//  Created by Umar Pirmahomed on 22/03/2023.
//

import SwiftUI

struct HeroInformationView: View {
    let hero : MarvelResult
    @State var currentComic: ComicsItem = ComicsItem(resourceURI: "", name: "Comic")
    var comics : [ComicsItem] = []
    var body: some View {
        NavigationView {
            VStack{
                Spacer(minLength: 100)
                List{
                    Text("Name: \(hero.name!)")
                    Text("Description: \(hero.description ?? "No desc")")
                    Picker("Comics", selection: $currentComic){
                        ForEach(hero.comics?.items ?? comics, id: \.self){ comic in
                            Text(comic.name!)
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            VStack {
                                Text("   ").font(.largeTitle)
                                HStack {
                                    Image("heroes")
                                        .resizable()
                                        .frame(width: 100,height: 100)
                                        .clipShape(Circle())
                                        .scaledToFill()

                                    Text(hero.name!).font(.largeTitle)
                                }
                            }
                        }
                        
                    }
        }
    }
}

struct HeroInformationView_Previews: PreviewProvider {
    static var previews: some View {
        HeroInformationView(hero: .init(id: 123, name: "Spider-Man", description: "hello hello", modified: "Date.now", thumbnail: Thumbnail(path: "", thumbnailExtension: nil), resourceURI: "sdf", comics: nil, series: nil, stories: nil, events: Comics(available: 12, collectionURI: "sdfd", items: nil, returned: 1), urls: nil))
    }
}
