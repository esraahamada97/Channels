import Foundation
import IGListKit

final class LatestMedia: NSObject, Codable {
    let type: TypeEnum
    let title: String
    let coverAsset: CoverAsset

}

enum TypeEnum: String, Codable {
    case course // small cell
    case video  //long cell
}
