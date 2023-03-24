//
//  ComicInformationView.swift
//  Marvel Heroes
//
//  Created by Umar Pirmahomed on 24/03/2023.
//

import SwiftUI

struct ComicInformationView: View {
    @Environment(\.dismiss) var dismiss
    var resourceUri : String
    @StateObject var comicsInformationVC = ComicsInformationViewController()
    var body: some View {
        NavigationStack{
            VStack{
                List {
                    ForEach(comicsInformationVC.comicResults, id: \.id) { ress in
                        VStack{
                            Text(ress.title!).font(.largeTitle).multilineTextAlignment(.center)
                            AsyncImage(
                                url: comicsInformationVC.imagePathBuilder(imageThumbnail: ress.thumbnail!),
                                content: { image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                },
                                placeholder: {
                                    ProgressView()
                                }
                            )
                            .frame(width: 200,height: 400)
                            
                            Text(ress.description ?? "Description Not Found")
                        }
                    }
                }
                
                
                Spacer()
                Button("dismiss") {
                    dismiss()
                }
                .font(.title2)
            }
        }
        .task{
            comicsInformationVC.fetchComic(urlStr: comicsInformationVC.pathApiVerification(resource: resourceUri)!)
        }
    }
}

struct ComicInformationView_Previews: PreviewProvider {
    static var previews: some View {
        ComicInformationView(resourceUri: "http://gateway.marvel.com/v1/public/comics/21366")
    }
}
