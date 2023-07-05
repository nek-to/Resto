enum Screens: String, Identifiable {
	case total
	case mainScreen
	case categories
	case searchScreen
	case account
	case cart
	
	var id: String {
		self.rawValue
	}
}
