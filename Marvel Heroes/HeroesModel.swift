// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let code: Int?
    let status, copyright, attributionText, attributionHTML: String?
    let etag: String?
    let data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
    let offset, limit, total, count: Int?
    let results: [MarvelResult]?
}

// MARK: - Result
struct MarvelResult: Codable, Hashable, Identifiable {
    static func == (lhs: MarvelResult, rhs: MarvelResult) -> Bool {
        lhs.id == rhs.id
    }
    
    let id: Int
    let name, description: String?
    let modified: String?
    let thumbnail: Thumbnail?
    let resourceURI: String?
    let comics, series: Comics?
    let stories: Stories?
    let events: Comics?
    let urls: [URLElement]?
}

// MARK: - Comics
struct Comics: Codable, Hashable {
    let available: Int?
    let collectionURI: String?
    let items: [ComicsItem]?
    let returned: Int?
}

// MARK: - ComicsItem
struct ComicsItem: Codable, Hashable {
    let resourceURI: String?
    let name: String?
}

// MARK: - Stories
struct Stories: Codable, Hashable {
    let available: Int?
    let collectionURI: String?
    let items: [StoriesItem]?
    let returned: Int?
}

// MARK: - StoriesItem
struct StoriesItem: Codable, Hashable {
    let resourceURI: String?
    let name: String?
    let type: ItemType?
}

enum ItemType: String, Codable, Hashable {
    case cover = "cover"
    case empty = ""
    case interiorStory = "interiorStory"
}

// MARK: - Thumbnail
struct Thumbnail: Codable, Hashable {
    let path: String?
    let thumbnailExtension: Extension?

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

enum Extension: String, Codable, Hashable {
    case gif = "gif"
    case jpg = "jpg"
}

// MARK: - URLElement
struct URLElement: Codable, Hashable {
    let type: URLType?
    let url: String?
}

enum URLType: String, Codable, Hashable {
    case comiclink = "comiclink"
    case detail = "detail"
    case wiki = "wiki"
}
