//
//  ContentView.swift
//  Marvel Heroes
//
//  Created by Umar Pirmahomed on 19/03/2023.
//

import SwiftUI


//struct response : Codable{
//    var data: Data
//}
//
//struct results: Codable{
//    var results: Data
//}
//
//struct Data: Codable{
//    var id: Int
//    var name: String
//}

struct Quotes : Codable{
    var quote: String
    var author: String
}
struct ContentView: View {
    @StateObject private var mvn = MarvelHeroesViewModel()
    var body: some View {
        NavigationView{
            ZStack {
                LinearGradient(gradient: Gradient(colors:[ .red, .black]), startPoint: .top, endPoint: .bottom) .ignoresSafeArea()
                VStack {
                        List {
                            ForEach(mvn.response, id: \.id) { ress in
                                NavigationLink( destination: HeroInformationView(hero: ress)){
                                    HeroView(hero: ress)
                                }
                            }
                            .toolbar{
                                ToolbarItem(placement: .principal){
                                    HStack{
                                        
                                        Image("Bally_logo.svg")
                                            .resizable()
                                            .frame(width: 170, height: 80)
                                        Text("X Marvel")
                                            .foregroundColor(.red)
                                            .font(.largeTitle.weight(.bold))
                                            .fontDesign(.default)
                                        
                                    }
                                }
                            }
                        }
                }
            }
            }
            
        }
        
        //        NavigationView{
        //            List{
        //                ForEach(mvn.response) { hero in
        //                    let _ = print(hero)
        //                    HeroesView(hero: hero)
        //                        .listRowSeparator(.hidden)
        //                }
        //
        //            }
        //        }
    }
    
    //    func fetchData () async{
    //        //create url
    //        guard let url = URL(string:
    //        //"https://api.breakingbadquotes.xyz/v1/quotes/20"
    //        "https://gateway.marvel.com:443/v1/public/characters?ts=7&apikey=ba970a0b0d3f4db979adcb441a8f9b52&hash=38abe4e296ba8828ebfd47a5c9e62c6b"
    //        ) else {
    //            print("invalid url")
    //            return
    //        }
    //        //fetch data from url
    //        do{
    //            var request = URLRequest(url: url)
    //            request.setValue("Jmr3aGHREy3aSCgI7OFu9w==AoP1CMlQ3WyZN1mL", forHTTPHeaderField: "X-Api-Key")
    //
    //            let (data, _) = try await URLSession.shared.data(from: url)
    //
    //            if let decodedResponse = try? JSONDecoder().decode([Quotes].self, from: data){
    //                dataSet = decodedResponse
    //            }
    //        } catch{
    //            print("invalid data")
    //        }
    //    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
