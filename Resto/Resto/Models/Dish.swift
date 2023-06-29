struct Dish: Codable, Identifiable {
	var id: Int
	var title: String
	var price: Int
	var weight: Int
	var description: String
	var imageUrl: String
	var tags: [String]
	
	enum CodingKeys: String, CodingKey {
		case id
		case title = "name"
		case price
		case weight
		case description
		case imageUrl = "image_url"
		case tags = "tegs"
	}
}
