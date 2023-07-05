import SwiftUI

struct MainScreen: View {
	@StateObject private var coordinator = Coordinator()
	
	var body: some View {
		NavigationStack(path: $coordinator.path) {
			coordinator.buildPage(.total)
				.sheet(item: $coordinator.sheet) { sheet in
					coordinator.buildSheet(sheet)
				}
				.navigationDestination(for: Screens.self) { page in
					coordinator.buildPage(page)
				}
		}
		.environmentObject(coordinator)
	}
}

struct MainScreen_Previews: PreviewProvider {
	static var previews: some View {
		MainScreen() 
	}
}
