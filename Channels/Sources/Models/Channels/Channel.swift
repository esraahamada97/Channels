///*
//Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com
//
//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//
//For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar
//
//*/
//
//import Foundation
//struct Channel : Codable {
//
//        let coverAsset : CoverAsset?
//        let iconAsset : AnyObject?
//        let id : String?
//        let latestMedia : [LatestMedia]?
//        let mediaCount : Int?
//        let series : [Series]?
//        let slug : String?
//        let title : String?
//
//        enum CodingKeys: String, CodingKey {
//                case coverAsset = "coverAsset"
//                case iconAsset = "iconAsset"
//                case id = "id"
//                case latestMedia = "latestMedia"
//                case mediaCount = "mediaCount"
//                case series = "series"
//                case slug = "slug"
//                case title = "title"
//        }
//
//        init(from decoder: Decoder) throws {
//                let values = try decoder.container(keyedBy: CodingKeys.self)
//                coverAsset = CoverAsset(from: decoder)
//
//                iconAsset = try values.decodeIfPresent(AnyObject.self, forKey: .iconAsset)
//                id = try values.decodeIfPresent(String.self, forKey: .id)
//                latestMedia = try values.decodeIfPresent([LatestMedia].self, forKey: .latestMedia)
//                mediaCount = try values.decodeIfPresent(Int.self, forKey: .mediaCount)
//                series = try values.decodeIfPresent([Series].self, forKey: .series)
//                slug = try values.decodeIfPresent(String.self, forKey: .slug)
//                title = try values.decodeIfPresent(String.self, forKey: .title)
//        }
//
//}
//
//struct Series : Codable {
//
//        let coverAsset : CoverAsset?
//        let title : String?
//
//        enum CodingKeys: String, CodingKey {
//                case coverAsset = "coverAsset"
//                case title = "title"
//        }
//
//        init(from decoder: Decoder) throws {
//                let values = try decoder.container(keyedBy: CodingKeys.self)
//                coverAsset = CoverAsset(from: decoder)
//                title = try values.decodeIfPresent(String.self, forKey: .title)
//        }
//
//}
//

struct Channel: Codable {
    let title: String
    let series: [Series]?
    let mediaCount: Int?
    let latestMedia: [LatestMedia]? //////
    let id: String?
    let iconAsset: IconAsset?
    let coverAsset: CoverAsset?
    let slug: String?
    
}
