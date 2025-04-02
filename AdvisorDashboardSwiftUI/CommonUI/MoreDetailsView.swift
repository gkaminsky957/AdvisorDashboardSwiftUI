//
//  MoreDetailsView.swift
//  AdvisorDashboardSwiftUI
//
//  Created by Gennady Kaminsky on 4/2/25.
//

import SwiftUI

struct MoreDetailsView: View {
    private var title: String
    
    init(title: String) {
        self.title = title
    }
    
    var body: some View {
        VStack {
            Divider()
                .frame(height: 1)
                .background(Color.black)
                .padding(.bottom, 5)
            
            HStack(alignment: .center) {
                Text("View Details")
                    .foregroundColor(.blue)
                    .padding(.bottom, 10)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.blue)
            }
        }
    }
}

#Preview {
    MoreDetailsView(title: "More Details")
}
