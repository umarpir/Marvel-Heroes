//
//  HeroesView.swift
//  Marvel Heroes
//
//  Created by Umar Pirmahomed on 21/03/2023.
//

import SwiftUI

struct HeroesView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Sample Hero")
            Text("Sample Hero description")
            Text("Sample Hero ID")
        }
    }
}

struct HeroesView_Previews: PreviewProvider {
    static var previews: some View {
        HeroesView()
    }
}
