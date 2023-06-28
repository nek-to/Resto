//
//  MainCategoryCard.swift
//  Resto
//
//  Created by admin on 28.06.2023.
//

import SwiftUI

struct MainCategoryCard: View {
	var title: String
	
    var body: some View {
		ZStack(alignment: .leading) {
			HStack(alignment: .top) {
				Text("Пекарни и кондитерские")
					.font(
						Font.custom("SF Pro Display", size: 20)
							.weight(.medium)
					)
					.kerning(0.2)
					.foregroundColor(.black)
					.frame(width: 191, alignment: .topLeading)
					.lineLimit(3)
					.padding(EdgeInsets.init(top: 12, leading: 16, bottom: 0, trailing: 0))
				Spacer()
				HStack {
					Image("backery")
				}
			}
		}
		.frame(height: 148)
		.ignoresSafeArea()
		.cornerRadius(10)
		.clipped()
	}
}

struct MainCategoryCard_Previews: PreviewProvider {
    static var previews: some View {
        MainCategoryCard(title: "Fruit")
			.previewLayout(.sizeThatFits)
    }
}
