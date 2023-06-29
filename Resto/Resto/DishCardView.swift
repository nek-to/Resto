import SwiftUI

struct DishCardView: View {
	var title: String
	var image: String
	
	var body: some View {
		VStack {
			ZStack {
				Color(red: 0.97, green: 0.97, blue: 0.96)
					.frame(width: 109, height: 109)
					.cornerRadius(10)

				AsyncImage(url: URL(string: image)) { cardImage in
					cardImage
						.resizable()
						.scaledToFit()
				} placeholder: {
					ProgressView()
				}
				.frame(width: 99, height: 99, alignment: .center)
			}
			
			Text(title)
				.font(Font.custom("SF Pro Display", size: 14))
				.lineLimit(3)
				.foregroundColor(.black)
				.frame(alignment: .leading)
		}
	}
}

struct DishCardView_Previews: PreviewProvider {
	static var previews: some View {
		DishCardView(title: "Dish", image: "place")
			.previewLayout(.sizeThatFits)
	}
}
