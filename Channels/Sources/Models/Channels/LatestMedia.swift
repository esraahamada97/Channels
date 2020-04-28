struct LatestMedia:  Codable {
    let type: TypeEnum
    let title: String
    let coverAsset: CoverAsset

}

enum TypeEnum: String, Codable {
    case course // small cell
    case video  //long cell
}
