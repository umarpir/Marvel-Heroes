//
//  ContentView.swift
//  Marvel Heroes
//
//  Created by Umar Pirmahomed on 19/03/2023.
//

import SwiftUI

struct Quote:Hashable, Codable{
//    var id : Int
//    var name: String
//    var description: String
//    var results: String
    var quote: String
    var author: String
}


struct ContentView: View {
    @State private var quotes = [Quote]()
    var publicKey = ""
    var privateKey = ""
    var body: some View {
        NavigationView{
            List(quotes, id: \.self) { quote in
                VStack(alignment: .leading){
                    Text(quote.quote)
                        .foregroundColor(Color.blue)
                        .font(.headline)
                    Text(quote.author)
                    
                }
                
            }
            .navigationTitle("helloooo")
            .task{
                await fetchData()
            }
        }
        
        
    }
    
    func fetchData () async{
        //create url
        guard let url = URL(string: //"https://gateway.marvel.com:443/v1/public/characters?ts=7&apikey=ba970a0b0d3f4db979adcb441a8f9b52&hash=38abe4e296ba8828ebfd47a5c9e62c6b"
            "https://api.breakingbadquotes.xyz/v1/quotes/20"
        ) else {
            print("invalid url")
            return
        }
        //fetch data from url
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode([Quote].self, from: data){
                quotes = decodedResponse
            }
        } catch{
            print("invalid data")
        }
        // decode data
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
