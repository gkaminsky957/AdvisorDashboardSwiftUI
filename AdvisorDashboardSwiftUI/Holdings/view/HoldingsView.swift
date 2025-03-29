//
//  HoldingsView.swift
//  AdvisorDashboardSwiftUI
//
//  Created by Gennady Kaminsky on 3/29/25.
//

import SwiftUI

struct HoldingsView: View {
    private var holdings: [HoldingModel]
    
    init(holdings: [HoldingModel]) {
        self.holdings = holdings
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(holdings) { holding in
                    HoldingsViewCell(name: holding.name,
                                     number: String(holding.units),
                                     price: String(holding.price))
                    .padding(.horizontal, 10)
                }
            }
        }
        .navigationTitle("Holdings SUmmary")
    }
}

#Preview {
    HoldingsView(holdings: [
        HoldingModel(name: "Holding Name",
                     units: 230,
                     price: 22.35)
    ])
}
