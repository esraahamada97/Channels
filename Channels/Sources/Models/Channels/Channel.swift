import Foundation

final class Channel: NSObject, Codable {
    let title: String
    let series: [Series]?
    let mediaCount: Int?
    let latestMedia: [LatestMedia]? //////
    let id: String?
    let iconAsset: IconAsset?
    let coverAsset: CoverAsset?
    let slug: String?
    
}
