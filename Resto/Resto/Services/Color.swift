import SwiftUI

extension Color {
	init(hex: String) {
		let scanner = Scanner(string: hex)
		var rgbValue: UInt64 = 0
		scanner.scanHexInt64(&rgbValue)

		let redValue = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
		let greenValue = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
		let blueValue = CGFloat(rgbValue & 0x0000FF) / 255.0

		self.init(red: redValue, green: greenValue, blue: blueValue)
	}
}
