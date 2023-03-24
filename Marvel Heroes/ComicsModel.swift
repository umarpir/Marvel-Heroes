import Foundation

// MARK: - Welcome
struct ComicsData: Codable {
    let code: Int?
    let status, copyright, attributionText, attributionHTML: String?
    let etag: String?
    let data: ComicsDataClass?
}

// MARK: - DataClass
struct ComicsDataClass: Codable {
    let results: [ComicsResult]?
}

// MARK: - Result
struct ComicsResult: Codable{
    
    let id, digitalID: Int?
    let title: String?
    let issueNumber: Int?
    let variantDescription, description: String?
    let isbn, upc, diamondCode, ean: String?
    let issn, format: String?
    let pageCount: Int?
    let resourceURI: String?
    let thumbnail: ComicThumbnail?
    let images: [ComicThumbnail]?
    let creators: Creators?

}

struct Creators: Codable {
    let available: Int?
    let collectionURI: String?
    let returned: Int?
}
struct ComicThumbnail: Codable {
    let path: String?
    let thumbnailExtension: String?

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}
