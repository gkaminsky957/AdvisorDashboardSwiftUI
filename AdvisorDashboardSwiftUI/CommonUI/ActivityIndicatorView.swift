//
//  ActivityIndicatorView.swift
//  AdvisorDashboardSwiftUI
//
//  Created by Gennady Kaminsky on 4/1/25.
//

import SwiftUI

struct ActivityIndicatorView: View {
    private var title: String
    
    init(title: String) {
        self.title = title
    }
    
    var body: some View {
        VStack {
            ProgressView("Loading accounts. Please wait...")
                .foregroundColor(.black)
        }
        .padding(40)
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 2)
        }
    }
}

#Preview {
    ActivityIndicatorView(title: "Loading accounts. Please wait...")
}
