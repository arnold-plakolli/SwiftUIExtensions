//
//  Copyright © Arnold Plakolli. All rights reserved.
//

import SwiftUI
import SwiftUIExtensions

struct Item: Identifiable {
	let id = UUID()
	let name: String
	let details: String
}

struct ContentView: View {
	@State var items: [Item] = (1...10)
		.map { .init(name: "Item \($0)", details: "Item \($0) is an awesome item") }
	@State var itemToDelete: Item?
	@State var expandedItemIDs: Set<UUID> = []
	
	var body: some View {
		List {
			ForEach(items) { item in
				DisclosureGroup(isExpanded: $expandedItemIDs.boolBinding(item.id)) {
					Text(item.details)
				} label: {
					Text(item.name)
				}
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
					items = items.filter { $0.id != item.id }
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
