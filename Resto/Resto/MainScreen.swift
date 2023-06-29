import SwiftUI

struct MainScreen: View {
    @StateObject private var viewModel = CategoriesViewModel()
    
    var body: some View {
        VStack {
            if let error = viewModel.error {
                Text(error.localizedDescription)
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
