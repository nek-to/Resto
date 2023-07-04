struct DishesModel: Codable {
	var dishes: [Dish]
	
	enum CodingKeys: String, CodingKey {
		case dishes
	}
}
