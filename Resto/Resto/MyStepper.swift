//
//  MyStepper.swift
//  Resto
//
//  Created by admin on 03.07.2023.
//

import SwiftUI

struct MyStepper: View {
	@State var value: Int

	var body: some View {
		HStack {
			HStack {
				Button("-") { value -= 1 }
				Spacer()
				Text(value.formatted())
				Spacer()
				Button("+") { value += 1 }
			}
			.padding(.vertical, 8)
			.padding(.horizontal, 16)
			.foregroundColor(.black)
			.background {
				Rectangle()
					.fill(Color(red: 0.94, green: 0.93, blue: 0.93))
					.cornerRadius(10)
					.frame(width: 99)
			}
		}
		.buttonStyle(.plain)
		.frame(width: 99)
		
	}
}

struct MyStepper_Previews: PreviewProvider {
	static var previews: some View {
		MyStepper(value: 0)
	}
}
