import SwiftUI

struct DishCardView: View {
	var title: String
	var image: String
	
    var body: some View {
		VStack {
			AsyncImage(url: URL(string: image)) { cardImage in
				cardImage.resizable()
					.scaledToFill()
			} placeholder: {
				ProgressView()
			}
			
			Text(title)
		}
		.clipped()
    }
}

struct DishCardView_Previews: PreviewProvider {
    static var previews: some View {
        DishCardView(title: "Dish", image: "place")
			.previewLayout(.sizeThatFits)
    }
}
