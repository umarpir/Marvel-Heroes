//
//  ComicsView.swift
//  Marvel Heroes
//
//  Created by Umar Pirmahomed on 23/03/2023.
//

import SwiftUI

struct ComicsView: View {
    let comic : ComicsItem
    var body: some View {
            VStack(alignment: .leading) {
                Text("\(comic.name ?? "N/A")").font(.title2)
                Divider()
                HStack {
                    Text("Resource Uri : ")
                    Text(comic.resourceURI ?? "N/A")
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
        ComicsView(comic: ComicsItem(resourceURI: "resource uri", name: "helllllo"))
    }
}
