//
//  Data.swift
//  FootLocker-Task
//
//  Created by Chandrasheela Hotkar on 20/02/23.
//

import Foundation
import RxSwift
import RxCocoa

// Data structure of Marvel API

struct MarvelData: Decodable{
    var data : Res

}

struct Res: Decodable{
        var results : [Response]

}

struct Response : Decodable{
    var id : Int
    var name : String
    var description : String
    var thumbnail : Img


}

struct Img : Decodable{
    var path : String


}







//struct Marvel: Decodable {
//    let code: Int
//   let status, copyright, attributionText, attributionHTML: String
//   let etag: String
//    let data: DataClass
//}
//struct DataClass: Decodable{
//    let offset, limit, total, count: Int
//    let results: [Result]
//}
//struct Result: Codable {
//    let id: Int
//    let name : String
//    let description : String
//    let thumbnail: Thumbnail
//    let resourceURI: String
//    let comics, series: Comics
//    let stories: Stories
//    let events: Comics
//    let urls: [URLElement]
//}
//struct Comics: Codable {
//    let available: Int
//    let collectionURI: String
//    let items: [ComicsItem]
//    let returned: Int
//}
//struct ComicsItem: Codable {
//    let resourceURI: String
//    let name: String
//}
//
//struct Stories: Codable {
//    let available: Int
//    let collectionURI: String
//    let items: [StoriesItem]
//    let returned: Int
//}
//
//
//struct StoriesItem: Codable {
//    let resourceURI: String
//    let name: String
//    let type: ItemType
//}
//enum ItemType: String, Codable {
//    case cover = "cover"
//    case empty = ""
//    case interiorStory = "interiorStory"
//}
//
//
//struct Thumbnail: Codable {
//    let path: String
//    let thumbnailExtension: Extension
//
//    enum CodingKeys: String, CodingKey {
//        case path
//        case thumbnailExtension = "extension"
//
//    }
//}
//
//enum Extension: String, Codable {
//    case gif = "gif"
//    case jpg = "jpg"
//}
//
//
//struct URLElement: Codable {
//    let type: URLType
//    let url: String
//}
//
//enum URLType: String, Codable {
//    case comiclink = "comiclink"
//    case detail = "detail"
//    case wiki = "wiki"
//}
