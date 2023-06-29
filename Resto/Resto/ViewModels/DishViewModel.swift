import Combine

final class DishViewModel: ObservableObject {
	@Published var dishes = DishesModel(dishes: [Dish]())
	
	@Published var error: Error?
	
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
			}
			.store(in: &cancelable)
	}
}
