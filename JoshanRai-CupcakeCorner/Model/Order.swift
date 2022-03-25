//
//  Order.swift
//  JoshanRai-CupcakeCorner
//
//  Created by Joshan Rai on 3/24/22.
//

import SwiftUI

enum CodingKeys: CodingKey {
    case type, quantity, extraFrosting, addSprinkles, name, streetAddress, city, zip
}

enum AlertType {
    case confirmation, error
}

class ObservableOrder: ObservableObject {
    @Published var order: Order
    
    init(order: Order) {
        self.order = order
    }
}

struct Order: Codable {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quantity = 3
    
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    
    var extraFrosting = false
    var addSprinkles = false
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        if name.isAllSpaces || streetAddress.isAllSpaces || city.isAllSpaces || zip.isAllSpaces {
            return false
        }
        
        return true
    }
    
    var cost: Double {
        var cost = Double(quantity) * 2
        
        cost += (Double(type) / 2)
        
        if extraFrosting {
            cost += Double(quantity)
        }
        
        if addSprinkles {
            cost += Double(quantity) / 2
        }
        
        return cost
    }
}

//  Challenge 1
fileprivate extension String {
    var isAllSpaces: Bool {
        guard !self.isEmpty else { return false }
        return self.drop(while: { $0 == " " }).isEmpty
    }
}
