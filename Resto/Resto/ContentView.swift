import SwiftUI

struct ContentView: View {
	@State private var selectedIndex = 0
	
	var body: some View {
		TabView(selection: $selectedIndex) {
			NavigationView {
				MainScreen()
			}
			.tabItem {
				if selectedIndex == 0 {
					Image("mainSelected")
				} else {
					Image("main")
				}
				Text("Главная")
			}
			.tag(0)
			NavigationView {
				SearchScreen()
			}
			.tabItem {
				if selectedIndex == 1 {
					Image("searchSelected")
				} else {
					Image("search")
				}
				Text("Поиск")
			}
			.tag(1)
			NavigationView {
				CartScreen()
			}
			.tabItem {
				if selectedIndex == 2 {
					Image("cartSelected")
				} else {
					Image("cart")
				}
				Text("Корзина")
			}
			.tag(2)
			NavigationView {
				AccountScreen()
			}
			.tabItem {
				if selectedIndex == 3 {
					Image("accountSelected")
				} else {
					Image("account")
				}
				Text("Профиль")
			}
			.tag(3)
		}
		.accentColor(Color(hex: "3364E0"))
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
