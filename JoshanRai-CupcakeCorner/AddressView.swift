//
//  AddressView.swift
//  JoshanRai-CupcakeCorner
//
//  Created by Joshan Rai on 3/24/22.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var observableOrder: ObservableOrder
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $observableOrder.order.name)
                TextField("Street Address", text: $observableOrder.order.streetAddress)
                TextField("City", text: $observableOrder.order.city)
                TextField("Zip", text: $observableOrder.order.zip)
            }
            
            Section {
                NavigationLink {
                    CheckoutView(observableOrder: observableOrder)
                } label: {
                    Text("Check out")
                }
            }
            .disabled(observableOrder.order.hasValidAddress == false)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(observableOrder: ObservableOrder(order: Order()))
    }
}
