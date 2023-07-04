import SwiftUI

struct MainScreen: View {
	@EnvironmentObject var coordinator: Coordinator
	
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
	}
}

struct MainScreen_Previews: PreviewProvider {
	@StateObject static var coordinator = Coordinator()
	static var previews: some View {
		MainScreen()
			.environmentObject(coordinator)
	}
}
