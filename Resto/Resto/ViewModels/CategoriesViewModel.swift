import Combine

final class CategoriesViewModel: ObservableObject {
    @Published var categories = CategoriesModel(сategories: [Category]())
    
    @Published var error: Error?
    
    private var cancelable = Set<AnyCancellable>()
    
    func fetchCategories() {
        NetworkManager.shared.getCategories()
            .sink { [weak self] completion in
                switch completion {
                case .failure(let error):
                    self?.error = error
                case .finished:
                    break
                }
            } receiveValue: { [weak self] categories in
                self?.categories = categories
            }
            .store(in: &cancelable)

    }
}
