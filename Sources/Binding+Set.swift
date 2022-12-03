//
//  Copyright © Arnold Plakolli. All rights reserved.
//

import SwiftUI

public extension Binding where Value == Bool {
	init<T: Equatable>(_ value: Binding<Set<T>>, item: T) {
		self.init(
			get: { value.wrappedValue.contains(item) },
			set: {
				if $0 {
					value.wrappedValue.insert(item)
				} else {
					value.wrappedValue.remove(item)
				}
			}
		)
	}
}

public extension Binding {
	func boolBinding<T: Equatable>(_ item: T) -> Binding<Bool> where Value == Set<T> {
		.init(self, item: item)
	}
}
