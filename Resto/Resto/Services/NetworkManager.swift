import Foundation
import Combine

private enum Urls {
    static let caterogies = "https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54"
    static let dishes = "https://run.mocky.io/v3/aba7ecaa-0a70-453b-b62d-0e326c859b3b"
}

class NetworkManager: ObservableObject {
	static let shared = NetworkManager()
	
	func getCategories() -> AnyPublisher<CategoriesModel, Error> {
        guard let url = URL(string: Urls.caterogies) else {
            return Fail(error: CustomError.invalidUrl).eraseToAnyPublisher()
		}
		
        return URLSession.shared.dataTaskPublisher(for: url)
            .map {
                $0.data
            }
            .decode(type: CategoriesModel.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
	}
	
	func getDishes() -> AnyPublisher<DishesModel, Error> {
        guard let url = URL(string: Urls.dishes) else {
            return Fail(error: CustomError.invalidUrl).eraseToAnyPublisher()
		}
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map {
                $0.data
            }
            .decode(type: DishesModel.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
	}
}
