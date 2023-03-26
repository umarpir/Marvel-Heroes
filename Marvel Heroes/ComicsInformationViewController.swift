//
//  ComicsInformationViewController.swift
//  Marvel Heroes
//
//  Created by Umar Pirmahomed on 24/03/2023.
//

import Foundation
class ComicsInformationViewController : ObservableObject{
    @Published var comicResults : [ComicsResult] = []
    private var publicKey: String = "0c863702b0b77a585e4071cbc3593dea"
    private var privateKey: String = "ff73168904c789744eca56e7c8dbca159776416c"
    private var urlString =  "https://gateway.marvel.com/v1/public/comics/22506?ts=1679582861&apikey=ba970a0b0d3f4db979adcb441a8f9b52&hash=d9e7cb4ea17cb3e0fb44f09fb5aa0320"
    var comicPath : String = ""

    
    func fetchComic (urlStr : URL?) {
        if let url = urlStr{
           URLSession.shared.dataTask(with: url) { data, response, error in
              if let data = data {
                  do {
                     let response = try JSONDecoder().decode(ComicsData.self, from: data)
                      if let comicsResult = response.data?.results {
                          print(comicsResult)
                          DispatchQueue.main.async {
                              self.comicResults = comicsResult
                          }
                          
                      }
                  } catch let error {
                     print(error)
                  }
               }
           }.resume()
        }
    }
    
    func urlRequest() -> String{
        let timeStamp = timeStamp()
        let apiUrl = "?ts=\(timeStamp)1&apikey=\(publicKey)&hash=\(md5Generator(pubKey:publicKey, timeStamp: timeStamp, privKey: privateKey))"

        return apiUrl.trimmingCharacters(in: .whitespaces)
    }
    
    func timeStamp() -> Int{
        let someDate = Date().timeIntervalSince1970
        let timeStamp = Int(someDate)
        return timeStamp
    }
    
    func md5Generator(pubKey: String, timeStamp: Int, privKey: String) -> String{
        let md5 = "\(timeStamp)\(privKey)\(pubKey)"
        return md5.MD5
    }
    
    func imagePathBuilder(imageThumbnail: ComicThumbnail) -> URL{
        let imageSize = "/detail."
        let imageExtention = "\(imageThumbnail.thumbnailExtension!)"
        comicPath = ("\(imageThumbnail.path!)\(imageSize)\(imageExtention)")
        comicPath = comicPath.replacingOccurrences(of: "http", with: "https")
        let url = URL(string: comicPath)
        let backUpUrl = URL(string: "https://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73/detail.jpg")
        return url ?? backUpUrl!
    }
    
    func pathApiVerification(resource: String) -> URL?{
        var apiUrl = resource.replacingOccurrences(of: "http", with: "https")
        let apiVerification = "?ts=\(timeStamp())&apikey=\(publicKey)&hash=\(md5Generator(pubKey: publicKey, timeStamp: timeStamp(), privKey: privateKey))"
        apiUrl.append(apiVerification)
        return URL(string: apiUrl)
    }
}
