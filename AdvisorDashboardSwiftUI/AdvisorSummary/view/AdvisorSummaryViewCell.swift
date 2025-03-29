//
//  AdvisorSummaryViewCell.swift
//  AdvisorDashboardSwiftUI
//
//  Created by Gennady Kaminsky on 3/26/25.
//

import SwiftUI

struct AdvisorSummaryViewCell: View {
    private var advisorName: String
    private var assets: String
    
    init(advisorName: String,
         assets: String) {
        self.advisorName = advisorName
        self.assets = assets
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading,
                   spacing: 10) {
                HStack(alignment: .top) {
                    Text("AdvisorName:")
                        .fontWeight(.bold)
                    Text(advisorName)
                    Spacer()
                }
                
                HStack(alignment: .top) {
                    Text("Assets:")
                        .fontWeight(.bold)
                    Text(assets)
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .padding()
        }
       .background(Color.white)
       .cornerRadius(10)
       .shadow(color: .black,
               radius: 3,
               x: 1,
               y: 2)
    }
}

#Preview {
    AdvisorSummaryViewCell(advisorName: "Ellon Smh",
                           assets: "Chase, Ameiprice, Bank Of America, Somet9hing else")
}
