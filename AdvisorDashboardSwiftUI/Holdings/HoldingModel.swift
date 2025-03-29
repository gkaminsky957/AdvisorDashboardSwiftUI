//
//  HoldingModel.swift
//  AdvisorDashboardSwiftUI
//
//  Created by Gennady Kaminsky on 3/29/25.
//

import Foundation

struct HoldingModel: Identifiable {
    var name: String
    var units: Int
    var price: Double
    var id: String
    
    init(name: String,
         units: Int,
         price: Double,
         id: String = UUID().uuidString) {
        self.name = name
        self.units = units
        self.price = price
        self.id = id
    }
}
