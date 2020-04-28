struct IconAsset: Codable {
    let thumbnailUrl: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case thumbnailUrl
        case url
    }
}
