//
//  MainScreen.swift
//  Resto
//
//  Created by admin on 28.06.2023.
//

import SwiftUI

struct MainScreen: View {
    var body: some View {
		List {
			MainCategoryCard(title: "LOl")
		}
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
