//
//  AccountSummaryViewCell.swift
//  AdvisorDashboardSwiftUI
//
//  Created by Gennady Kaminsky on 3/27/25.
//

import SwiftUI

struct AccountSummaryViewCell: View {
    private var name: String
    private var number: String
    private var custodian: String
    
    init(name: String,
         number: String,
         custodian: String)  {
        self.name = name
        self.number = number
        self.custodian = custodian
    }
    
    var body: some View {
        VStack(alignment: .leading,
               spacing: 10) {
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
                    Text(custodian)
                        .foregroundColor(.black)
                    Spacer()
                }
            }) {
                Text("Custodian:")
                    .fontWeight(.bold)
            }
            
            MoreDetailsView(title: "View Details")
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
    AccountSummaryViewCell(name: "Taylor Swift account - 401k",
                           number: "12345", 
                           custodian: "Bank Of America, Chase Bank")
}
