//
//  ModalView.swift
//  Resto
//
//  Created by admin on 03.07.2023.
//

import SwiftUI

struct ModalView: View {
	@Binding var isPresented: Bool
	@State private var isLiked = false
	
	init(_ isPresented: Binding<Bool>) {
		self._isPresented = isPresented
	}
	
	init() {
		self._isPresented = .constant(false)
	}

	var body: some View {
		VStack(alignment: .center) {
			ZStack(alignment: .top) {
				Image(systemName: "person")
					.resizable()
					.scaledToFit()
					.padding(.all)

				HStack {
					Spacer()

					Button(action: {
						// Toggle the button state
						isLiked.toggle()
					}) {
						// Show a heart icon if the button is liked, or an outline otherwise
						Image(systemName: isLiked ? "heart.fill" : "heart")
							.foregroundColor(isLiked ? .red : .black)
							.frame(width: 40, height: 40)
							.background(Color.white)
							.cornerRadius(8)
					}

					Button(action: {
						isPresented = false
					})
					{
						// Show a heart icon if the button is liked, or an outline otherwise
						Image(systemName: "xmark.circle")
							.foregroundColor(Color.black)
							.frame(width: 40, height: 40)
							.background(Color.white)
							.cornerRadius(8)
					}
				}
				.padding(.top)
				.padding(.horizontal)
			}
			.frame(width: 311, height: 232)
			.background(Color(red: 0.97, green: 0.97, blue: 0.96))
			.cornerRadius(10)
			.padding(.top)

			VStack(alignment: .leading) {
				Text("Рыба с овощами и рисом")
					.font(
						Font.custom("SF Pro Display", size: 16)
							.weight(.medium)
					)
					.kerning(0.16)
					.foregroundColor(.black)

				HStack {
					Text("799 ₽")
						.font(Font.custom("SF Pro Display", size: 14))
						.foregroundColor(.black)

					Text("· 560г")
						.font(Font.custom("SF Pro Display", size: 14))
						.foregroundColor(.gray)
				}

				Text("Рыба маринованная со специями, лимонным соком, соевым соусом и запечeнная в духовке с лучком, томатами и картошечкой под золотистой майонезно-сырной шубкой")
					.font(Font.custom("SF Pro Display", size: 14))
					.lineLimit(nil)
					.foregroundColor(.black.opacity(0.65))
					.frame(width: 311, alignment: .leading)
					.padding(.vertical, 5)
			}
			.padding(.horizontal)

			Button {
				print("pay")
			} label: {
				Text("Оплатить")
					.foregroundColor(Color.white)
			}
			.frame(width: 300,height: 48)
			.background(Color.blue)
			.cornerRadius(10)


			Spacer()
		}
		.frame(width: 343, height: 446)
		.background(Color.white)
		.cornerRadius(15)
	}
}

struct BlurView: UIViewRepresentable {
	func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
	}
	
	func makeUIView(context: Context) -> UIVisualEffectView {
		let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemThinMaterial))
		return view
	}
}

//struct ModalView_Previews: PreviewProvider {
//    static var previews: some View {
//        ModalView()
//    }
//}
