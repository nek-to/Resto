import SwiftUI

struct MainScreen: View {
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
					.padding(.all)
			}
			
			if (viewModel.error != nil) {
                ProgressView()
            } else {
                List(viewModel.categories.сategories) { category in
                    MainCategoryCard(id: category.id, title: category.title, image: category.imageUrl)
                }
                .onAppear {
                    viewModel.fetchCategories()
                }
            }
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
