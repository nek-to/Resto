import SwiftUI

@MainActor
final class Coordinator: ObservableObject {
	@Published var path = NavigationPath()
	@Published var screen: Screens = .mainScreen
	@Published var sheet: Sheets?
	@Published var currentTab: String?
	
	var mainScreenScreen: Screens = .total
	var categoriesScreen: Screens = .categories
	
	func toMain() {
		path.removeLast(path.count)
	}
	
	func toCategories() {
		path.append(Screens.categories)
	}
	
	func toSearch() {
		path.append(Screens.searchScreen)
	}
	
	func toProfile() {
		path.append(Screens.account)
	}
	
	func toDishPopup() {
		sheet = .dishPopup
	}
	
	@ViewBuilder
	func buildPage(_ page: Screens) -> some View {
		switch page {
		case .total:
			TotalScreen()
		case .mainScreen:
			MainScreen()
		case .categories:
			CategoryScreen()
		case .searchScreen:
			SearchScreen()
		case .account:
			AccountScreen()
		case .cart:
			CartScreen()
		}
	}
	
	@ViewBuilder
	func buildSheet(_ sheet: Sheets) -> some View {
		switch sheet {
		case .dishPopup:
			ModalView()
		}
	}
}
