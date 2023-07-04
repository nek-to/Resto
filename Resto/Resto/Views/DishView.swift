import SwiftUI

struct DishView: View {
	var title: String
	var image: String
	
	var body: some View {
		VStack(alignment: .leading) {
			VStack {
				AsyncImage(url: URL(string: image)) { cardImage in
					cardImage
						.resizable()
						.scaledToFit()
				} placeholder: {
					ProgressView()
				}
				.frame(width: 99, height: 99, alignment: .center)
			}
			.frame(width: 109, height: 109)
			.background(Color(red: 0.97, green: 0.97, blue: 0.96))
			.cornerRadius(10)
			
			Text(title)
				.font(Font.custom("SF Pro Display", size: 14))
				.lineLimit(2)
				.foregroundColor(.black)
				.frame(height: 36 ,alignment: .topLeading)
		}
		.frame(height: 144)
	}
}

struct DishView_Previews: PreviewProvider {
	static var previews: some View {
		DishView(title: "Dish", image: "place")
			.previewLayout(.sizeThatFits)
	}
}
