//
//  Copyright © Arnold Plakolli. All rights reserved.
//

import SwiftUI
import SwiftUIExtensions

struct ContentView: View {
	@State var items: [String] = (1...10).map { "Item \($0)" }
	@State var itemToDelete: String?
	
	var body: some View {
		List {
			ForEach(items, id: \.self) { item in
				Text(item)
					.swipeActions(edge: .trailing) {
						Button(role: .destructive) {
							itemToDelete = item
						} label: {
							Image(systemName: "trash")
						}
					}
			}
		}
		.navigationTitle("Items")
		.confirmationDialog("Delete Item", isPresented: $itemToDelete.boolBinding(), presenting: itemToDelete) { item in
			Button(role: .cancel) {} label: {
				Text("Cancel")
			}
			
			Button(role: .destructive) {
				withAnimation {
					items = items.filter { $0 != item }
				}
			} label: {
				Text("Delete")
			}
		} message: { item in
			Text("Are you sure you want to delete this item?")
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView {
			ContentView()
		}
	}
}
