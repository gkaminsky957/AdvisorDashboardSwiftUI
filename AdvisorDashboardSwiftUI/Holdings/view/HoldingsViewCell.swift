//
//  HoldingsViewCell.swift
//  AdvisorDashboardSwiftUI
//
//  Created by Gennady Kaminsky on 3/29/25.
//

import SwiftUI

struct HoldingsViewCell: View {
    private var name: String
    private var number: String
    private var price: String
    
    init(name: String,
         number: String,
         price: String)  {
        self.name = name
        self.number = number
        self.price = price
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            LabeledContent(content: {
                HStack {
                    Text(name)
                        .foregroundColor(.black)
                    Spacer()
                }
            }) {
                Text("Name:")
                    .fontWeight(.bold)
            }
            .padding(.top, 10)
            
            LabeledContent(content: {
                HStack {
                    Text(number)
                        .foregroundColor(.black)
                    Spacer()
                }
            }) {
                Text("Number:")
                    .fontWeight(.bold)
            }
            
            LabeledContent(content: {
                HStack {
                    Text(price)
                        .foregroundColor(.black)
                    Spacer()
                }
            }) {
                Text("Price:")
                    .fontWeight(.bold)
            }
            .padding(.bottom, 10)
        }
        .padding(.horizontal, 10)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: .black,
                radius: 3,
                x: 1,
                y: 2)
    }
}

#Preview {
    HoldingsViewCell(name: "Chase Bank",
                     number: "10",
                     price: "24.50")
}
