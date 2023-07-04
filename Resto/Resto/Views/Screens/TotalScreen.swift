import SwiftUI

struct TotalScreen: View {
	@EnvironmentObject var coordinator: Coordinator
	@StateObject private var viewModel = CategoriesViewModel()
	
	var body: some View {
		VStack {
			HStack {
				Image("pin")
					.padding(.leading)
				
				VStack(alignment: .leading) {
					Text("Санкт-Петербург")
						.font(
							Font.custom("SF Pro Display", size: 18)
								.weight(.medium)
						)
						.foregroundColor(.black)
					
					Text("12 Августа, 2023")
						.font(Font.custom("SF Pro Display", size: 14))
						.kerning(0.14)
						.foregroundColor(.black.opacity(0.5))
				}
				
				Spacer()
				
				Image("profile")
					.frame(width: 44, height: 44)
					.background(.white)
					.cornerRadius(100)
					.padding(.horizontal)
			}
			
			if (viewModel.error != nil) {
				ProgressView()
			} else {
				ScrollView {
					LazyVGrid(columns: [GridItem(.flexible())]) {
						ForEach(viewModel.categories.сategories) { category in
							NavigationLink(destination: CategoryScreen()) {
//							Button {
//								coordinator.toCategories()
//							} label: {
								MainCategoryCard(id: category.id, title: category.title, image: category.imageUrl)
									.cornerRadius(10)
									.padding(.horizontal, 10)
							}
						}
					}
					.onAppear {
						viewModel.fetchCategories()
					}
				}
			}
			
			Spacer()
		}
	}
}

struct TotalScreen_Previews: PreviewProvider {
	@StateObject static var coordinator = Coordinator()
	static var previews: some View {
		TotalScreen()
			.environmentObject(coordinator)
	}
}
