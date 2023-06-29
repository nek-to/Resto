import SwiftUI

struct ContentView: View {
    var body: some View {
		TabView {
			MainScreen()
				.tabItem {
					Image(systemName: "house")
					Text("Home")
				}
			CategoryScreen()
				.tabItem {
				Image(systemName: "magnifyingglass")
				Text("search")
			}
			CardScreen()
				.tabItem {
				Image(systemName: "cart")
				Text("cart")
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
