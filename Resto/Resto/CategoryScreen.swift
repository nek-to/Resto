import SwiftUI

struct CategoryScreen: View {
	@StateObject var viewModel = DishViewModel()
	
	let data = Array(0...5)
	
	var body: some View {
		VStack {
			HStack {
				Spacer()
				
				Text("Азиатская кухня")
				  .font(
					Font.custom("SF Pro Display", size: 18)
					  .weight(.medium)
				  )
				  .multilineTextAlignment(.center)
				  .foregroundColor(.black)
				
				Spacer()
				
				Image("profile")
					.frame(width: 44, height: 44)
					.background(.white)
					.cornerRadius(100)
					.padding(.horizontal)
			}
			.padding(.horizontal)
			.frame(height: 60)
			
			ScrollView(.horizontal) {
				LazyHGrid(rows: [GridItem(.flexible())]) {
					ForEach(data, id: \.self) { tag in
							Rectangle()
								.frame(width: 80, height: 35)
								.foregroundColor(Color.red)
								.cornerRadius(10)
					}
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
	}
}

struct CategoryScreen_Previews: PreviewProvider {
	static var previews: some View {
		CategoryScreen()
	}
}
