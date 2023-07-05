import SwiftUI

@MainActor
final class Coordinator: ObservableObject {
	@Published var path = NavigationPath()
	@Published var sheet: Sheets?
	@Published var navigationTitle: String = ""
	
	func push(_ page: Screens) {
		path.append(page)
	}
	
	func present(_ sheet: Sheets) {
		self.sheet = sheet
	}
	
	func pop() {
		path.removeLast()
	}
	
	func popToRoot() {
		path.removeLast(path.count)
	}
	
	func dismiss() {
		self.sheet = nil
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
				.navigationBarBackButtonHidden(true)
				.navigationBarItems(leading: BackButton())
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
