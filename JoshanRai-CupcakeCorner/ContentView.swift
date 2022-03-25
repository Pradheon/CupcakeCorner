//
//  ContentView.swift
//  JoshanRai-CupcakeCorner
//
//  Created by Joshan Rai on 3/23/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var observableOrder = ObservableOrder(order: Order())
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $observableOrder.order.type) {
                        ForEach(Order.types.indices) {
                            Text(Order.types[$0])
                        }
                    }
                    Stepper("Number of cakes: \(observableOrder.order.quantity)", value: $observableOrder.order.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Special requests?", isOn: $observableOrder.order.specialRequestEnabled.animation())
                    
                    if observableOrder.order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $observableOrder.order.extraFrosting)
                        Toggle("Add extra sprinkles", isOn: $observableOrder.order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink {
                        AddressView(observableOrder: observableOrder)
                    } label: {
                        Text("Delivery details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
