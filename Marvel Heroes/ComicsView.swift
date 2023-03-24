//
//  ComicsView.swift
//  Marvel Heroes
//
//  Created by Umar Pirmahomed on 23/03/2023.
//

import SwiftUI

struct ComicsView: View {
    let comic : ComicsItem
    @StateObject var comicsVC = ComicsViewController()
    @StateObject var comicsInformationVC = ComicsInformationViewController()

    var body: some View {
        
        VStack(alignment: .leading) {
            Text("\(comic.name ?? "N/A")").font(.title2)
            Divider()
            HStack {
                Spacer()
                Button("select"){
                    comicsVC.showComic.toggle()
                }
                
                .sheet(isPresented: $comicsVC.showComic) {
                    ComicInformationView(resourceUri: comic.resourceURI!)
            }
                Spacer()
            }
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.gray.opacity(0.1), in: RoundedRectangle(cornerRadius: 10, style: .continuous))
        .padding(.horizontal,4)
    }
    
    
}

struct ComicsView_Previews: PreviewProvider {
    static var previews: some View {
        ComicsView(comic: ComicsItem(resourceURI: "http://gateway.marvel.com/v1/public/comics/22506?ts=1679582861&apikey=ba970a0b0d3f4db979adcb441a8f9b52&hash=d9e7cb4ea17cb3e0fb44f09fb5aa0320", name: "helllllo"))
    }
}
