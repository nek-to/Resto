import SwiftUI

struct BackButton: View {
	@Environment(\.presentationMode) var presentationMode
	
	var body: some View {
		Button(action: {
			presentationMode.wrappedValue.dismiss()
		}) {
			Image(systemName: "chevron.left")
				.foregroundColor(.black)
				.imageScale(.large)
		}
		.accessibility(label: Text("")) // For accessibility
	}
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
		BackButton()
    }
}
