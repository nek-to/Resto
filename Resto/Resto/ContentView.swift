import SwiftUI

struct ContentView: View {
	var body: some View {
		VStack {
			TabView {
				MainScreen()
					.tabItem {
						Image("main")
						Text("Главная")
					}
				CategoryScreen()
					.tabItem {
						Image("search")
						Text("Поиск")
					}
				CardScreen()
					.tabItem {
						Image("cart")
						Text("Корзина")
					}
				AccountView()
					.tabItem {
						Image("account")
						Text("Профиль")
					}
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
