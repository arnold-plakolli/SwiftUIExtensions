//
//  Copyright © Arnold Plakolli. All rights reserved.
//

import SwiftUI

public extension Binding where Value == Bool {
	init<T>(_ value: Binding<T?>) {
		self.init(
			get: { value.wrappedValue != nil },
			set: {
				if !$0 {
					value.wrappedValue = nil
				}
			}
		)
	}
}

public extension Binding {
	func boolBinding<T>() -> Binding<Bool> where Value == T? {
		.init(self)
	}
}
