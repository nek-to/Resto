import SwiftUI

struct CategoryScreen: View {
	@EnvironmentObject private var coordinator: Coordinator
	@StateObject private var viewModel = DishViewModel()
	@State private var showSheet = false
		
	var body: some View {
		ZStack(alignment: .center) {
			VStack {
				ScrollView(.horizontal) {
					LazyHGrid(rows: [GridItem(.flexible())]) {
						ForEach(Array(viewModel.setOfTags.sorted()), id: \.self) { tag in
							ZStack {
								Rectangle()
									.foregroundColor(Color(hex: "F8F7F5"))
									.cornerRadius(10)
								
								HStack {
									Text(tag)
										.foregroundColor(.black)
										.padding(.horizontal, 10)
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
								Button {
									showSheet.toggle()
								} label: {
									DishView(title: dish.title, image: dish.imageUrl)
								}
							}
						}
					}
					.onAppear {
						viewModel.fetchDishes()
					}
					.padding( 10)
					.scrollIndicators(.hidden)
				}
			}
			.disabled(showSheet ? true : false)
			.blur(radius: showSheet ? 20 : 0)
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					Image("profile")
						.frame(width: 44, height: 44)
						.background(.white)
						.cornerRadius(22)
				}
			}
			.navigationTitle(coordinator.navigationTitle)
			.navigationBarTitleDisplayMode(.inline)
			
			
			if showSheet {
				ModalView($showSheet)
			}
		}
	}
}

struct CategoryScreen_Previews: PreviewProvider {
	@StateObject static var coordinator = Coordinator()
	static var previews: some View {
		CategoryScreen()
			.environmentObject(coordinator)
	}
}
