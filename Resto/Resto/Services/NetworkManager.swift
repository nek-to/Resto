import Foundation

class NetworkManager: ObservableObject {
	static let shared = NetworkManager()
	
	func getCategories(completion: @escaping ((CategoriesModel?, Error?) -> Void)) {
		guard let url = URL(string: "https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54") else {
			NSLog("Incorrect url")
			return
		}
		
		URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
			if let data {
				do {
					let result = try JSONDecoder().decode(CategoriesModel.self, from: data)
					completion(result, nil)
				} catch {
					print(error)
				}
			}
		}.resume()
	}
	
	func getDishes(completion: @escaping ((DishesModel?, Error?) -> Void)) {
		guard let url = URL(string: "https://run.mocky.io/v3/aba7ecaa-0a70-453b-b62d-0e326c859b3b") else {
			NSLog("Incorrect url")
			return
		}
		
		URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
			if let data {
				do {
					let result = try JSONDecoder().decode(DishesModel.self, from: data)
					completion(result, nil)
				} catch {
					print(error)
				}
			}
		}.resume()
	}
}
