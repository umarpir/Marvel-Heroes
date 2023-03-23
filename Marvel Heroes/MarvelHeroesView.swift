//
//  ContentView.swift
//  Marvel Heroes
//
//  Created by Umar Pirmahomed on 19/03/2023.
//

import SwiftUI

struct Quotes : Codable{
    var quote: String
    var author: String
}
struct ContentView: View {
    @StateObject private var mvn = MarvelHeroesViewModel()
    var body: some View {
        NavigationStack{
            ZStack {
                VStack {
                    HStack{
                        
                        Image("Bally_logo.svg")
                            .resizable()
                            .frame(width: 170, height: 80)
                        Text("X Marvel")
                            .foregroundColor(Color(red: 1, green: 0, blue: 0))
                            .font(.largeTitle.weight(.bold))
                            .fontDesign(.default)
                        
                    }
                    List {
                        ForEach(mvn.response, id: \.id) { ress in
                            NavigationLink(destination: HeroInformationView(hero: ress)){
                                HeroView(hero: ress)
                            }
                        }
                    }
                }  .background(.black)
            }
        }
        
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
