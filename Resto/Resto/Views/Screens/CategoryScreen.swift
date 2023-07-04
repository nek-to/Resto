import SwiftUI

struct CategoryScreen: View {
	@EnvironmentObject var coordinator: Coordinator
	@StateObject var viewModel = DishViewModel()
	//	let selectedCategory: String?
	
	let data = Array(0...5)
	
	var body: some View {
		VStack {
			ScrollView(.horizontal) {
				LazyHGrid(rows: [GridItem(.flexible())]) {
					ForEach(Array(viewModel.setOfTags.sorted()), id: \.self) { tag in
						ZStack {
							Rectangle()
								.foregroundColor(Color.white)
								.cornerRadius(10)

							HStack {
								Text(tag)
									.foregroundColor(.black)
									.padding(.horizontal, 10)
//									.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)

								Spacer()
							}
						}
						.frame(height: 35)
					}
					.padding(.horizontal, 5)
				}
			}
			.frame(height: 40)
			.scrollIndicators(.hidden)
			.padding(.horizontal)
			
			if let error = viewModel.error {
				Text(error.localizedDescription)
			} else {
				ScrollView {
					LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3)) {
						ForEach(viewModel.dishes.dishes, id: \.id) { dish in
							DishView(title: dish.title, image: dish.imageUrl)
						}
					}
				}
				.onAppear {
					viewModel.fetchDishes()
				}
				.padding(10)
				.scrollIndicators(.hidden)
			}
		}
		.toolbar {
			ToolbarItem(placement: .navigationBarTrailing) {
				HStack {
					Spacer()
					
					Image("profile")
						.frame(width: 44, height: 44)
						.background(.white)
						.cornerRadius(100)
						.padding(.horizontal)
				}
			}
		}
	}
}

struct CategoryScreen_Previews: PreviewProvider {
	@State static var coordinator = Coordinator()
	static var previews: some View {
		CategoryScreen()
			.environmentObject(coordinator)
	}
}
