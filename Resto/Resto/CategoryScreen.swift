//
//  CategoryScreen.swift
//  Resto
//
//  Created by admin on 28.06.2023.
//

import SwiftUI

struct CategoryScreen: View {
	@StateObject var viewModel = DishViewModel()
	
	var body: some View {
		if let error = viewModel.error {
			Text(error.localizedDescription)
		} else {
			ScrollView {
				LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 16) {
					ForEach(viewModel.dishes.dishes, id: \.id) { dish in
						DishCardView(title: dish.title, image: dish.imageUrl)
					}
				}
				.padding()
			}
			.onAppear {
				viewModel.fetchDishes()
			}
		}
	}
}

struct CategoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        CategoryScreen()
    }
}
