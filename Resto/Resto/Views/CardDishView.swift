import SwiftUI

struct CardDishView: View {
	@State private var cartCount = 0
	
	var body: some View {
		HStack {
			HStack {
				Image(systemName: "person")
					.resizable()
					.scaledToFill()
					.frame(width: 62, height: 62)
					.padding(.all, 10)
				
				VStack(alignment: .leading) {
					Text("Рыба с овощами и рисом")
						.font(Font.custom("SF Pro Display", size: 14))
						.foregroundColor(.black)
						.frame(width: 120, height: 40, alignment: .leading)
						.lineLimit(2)
					HStack {
						Text("799 ₽")
							.font(Font.custom("SF Pro Display", size: 14))
							.foregroundColor(.black)
						
						Text("· 560г")
							.font(Font.custom("SF Pro Display", size: 14))
							.foregroundColor(.gray)
					}
				}
				
				Spacer()
				
				MyStepper(value: 0)
			}
			.padding(.horizontal)
		}
	}
}

struct CardDishView_Previews: PreviewProvider {
	static var previews: some View {
		CardDishView()
	}
}
