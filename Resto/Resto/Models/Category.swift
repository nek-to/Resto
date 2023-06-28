struct Category: Codable {
	var id: Int
	var title: String
	var imageUrl: String
	
	enum CodingKeys: String, CodingKey {
		case id
		case title = "name"
		case imageUrl = "image_url"
	}
}

