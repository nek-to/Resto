import SwiftUI

struct CartScreen: View {
	@State private var showSheet = false
	let data = Array(0...5)
	
	var body: some View {
		ZStack(alignment: .center) {
			VStack {
				HStack {
					Image("pin")
						.padding(.leading)
					
					VStack(alignment: .leading) {
						Text("Санкт-Петербург")
							.font(
								Font.custom("SF Pro Display", size: 18)
									.weight(.medium)
							)
							.foregroundColor(.black)
						
						Text("12 Августа, 2023")
							.font(Font.custom("SF Pro Display", size: 14))
							.kerning(0.14)
							.foregroundColor(.black.opacity(0.5))
					}
					
					Spacer()
					
					Image("profile")
						.frame(width: 44, height: 44)
						.background(.white)
						.cornerRadius(100)
						.padding(.all)
				}
				
				ScrollView {
					LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 1)) {
						ForEach(data, id: \.self) { dish in
							CardDishView()
						}
					}
				}
				
				Button {
					showSheet.toggle()
					print("pay")
				} label: {
					Text("Оплатить")
						.foregroundColor(Color.white)
				}
				.disabled(showSheet)
				.frame(width: 300,height: 48)
				.background(Color.blue)
				.cornerRadius(10)
				.padding(.all, 16)
			}
			.blur(radius: showSheet ? 20 : 0)
			
			if showSheet {
				ModalView($showSheet)
			}
		}
	}
}

struct CardScreen_Previews: PreviewProvider {
	static var previews: some View {
		CartScreen()
	}
}
