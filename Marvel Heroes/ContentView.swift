//
//  ContentView.swift
//  Marvel Heroes
//
//  Created by Umar Pirmahomed on 19/03/2023.
//

import SwiftUI

struct Quote: Codable{
    var quote : String
    var author: String
}


struct ContentView: View {
    @State private var quotes = [Quote]()
    var body: some View {
        NavigationView{
            List(quotes, id: \.quote) { quote in
                VStack(alignment: .leading){
                    Text(quote.author)
                        .foregroundColor(Color.blue)
                        .font(.headline)
                    Text(quote.quote)
                    
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
        guard let url = URL(string: "https://api.breakingbadquotes.xyz/v1/quotes/20") else {
            print("invalid url")
            return
        }
        //fetch data from url
        do{
            let (data,_) = try await URLSession.shared.data(from: url)
            
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
