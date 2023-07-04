import Combine

final class DishViewModel: ObservableObject {
	@Published var dishes = DishesModel(dishes: [Dish]())
	@Published var error: Error?
	var setOfTags: Set<String> = []
	
	private var cancelable = Set<AnyCancellable>()
	
	func fetchDishes() {
		NetworkManager.shared.getDishes()
			.sink { [weak self] completion in
				switch completion {
				case .failure(let error):
					self?.error = error
				case .finished:
					break
				}
			} receiveValue: { [weak self] dish in
				self?.dishes = dish
				dish.dishes.forEach { dishTag in
					dishTag.tags.forEach { [weak self] tag in
						self?.setOfTags.insert(tag)
					}
				}
			}
			.store(in: &cancelable)
	}
}
