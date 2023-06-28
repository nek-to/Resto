//
//  ContentView.swift
//  Resto
//
//  Created by admin on 28.06.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		TabView {
			MainScreen()
				.tabItem {
					Image(systemName: "house")
					Text("Home")
				}
			CategoryScreen()
				.tabItem {
				Image(systemName: "person")
				Text("category")
			}
			CardScreen()
				.tabItem {
				Image(systemName: "card")
				Text("card")
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
