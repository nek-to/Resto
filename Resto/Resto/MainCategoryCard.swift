//
//  MainCategoryCard.swift
//  Resto
//
//  Created by admin on 28.06.2023.
//

import SwiftUI

struct MainCategoryCard: View {
    var id: Int
	var title: String
    var image: String
	
    var body: some View {
		ZStack(alignment: .topLeading) {
			HStack {
				AsyncImage(url: URL(string: image)) { cardImage in
					cardImage.resizable()
						.scaledToFill()
				} placeholder: {
					ProgressView()
				}
			}
			HStack(alignment: .top) {
				Text(title)
					.font(
						Font.custom("SF Pro Display", size: 20)
							.weight(.medium)
					)
					.foregroundColor(.black)
					.frame(width: 191, alignment: .topLeading)
					.lineLimit(3)
					.padding(EdgeInsets.init(top: 12, leading: 16, bottom: 0, trailing: 0))
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
        MainCategoryCard(id: 0, title: "Fruit", image: "person")
			.previewLayout(.sizeThatFits)
    }
}
