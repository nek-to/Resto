//
//  ContentView.swift
//  Resto
//
//  Created by admin on 28.06.2023.
//

import SwiftUI

struct ContentView: View {
	var network = NetworkManager()
	
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
		.onAppear {
			network.getCategories { res, er in
				print("_____ \(res?.сategories.first)")
				print("----- \(er)")
			}
			network.getDishes { res, er in
				print("_____ \(res?.dishes.first)")
				print("----- \(er)")
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
