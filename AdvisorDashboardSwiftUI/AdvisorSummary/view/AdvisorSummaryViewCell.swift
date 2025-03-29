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
                
                LabeledContent(content: {
                    HStack {
                        Text(advisorName)
                            .foregroundColor(.black)
                        Spacer()
                    }
                }) {
                    Text("AdvisorName:")
                        .fontWeight(.bold)
                }
                LabeledContent(content: {
                    HStack {
                        Text(assets)
                            .foregroundColor(.black)
                        Spacer()
                    }
                }) {
                    Text("Assets:")
                        .fontWeight(.bold)
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
