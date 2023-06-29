import SwiftUI

struct CategoryScreen: View {
	@StateObject var viewModel = DishViewModel()
	
	var body: some View {
		if let error = viewModel.error {
			Text(error.localizedDescription)
		} else {
			ScrollView {
				LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3)) {
					ForEach(viewModel.dishes.dishes, id: \.id) { dish in
						DishCardView(title: dish.title, image: dish.imageUrl)
							.frame(height: 150)
					}
				}
			}
			.onAppear {
				viewModel.fetchDishes()
			}
			.padding(10)
		}
	}
}

struct CategoryScreen_Previews: PreviewProvider {
	static var previews: some View {
		CategoryScreen()
	}
}
