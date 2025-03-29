//
//  AccountSummaryViewModel.swift
//  AdvisorDashboardSwiftUI
//
//  Created by Gennady Kaminsky on 3/27/25.
//

import SwiftUI

class AccountSummaryViewModel: ObservableObject {
    @Published var summaries: [AccountSummaryModel.AccountSummary] = []
    
    private var client: AccountSummaryClientProtocol
    
    init(client: AccountSummaryClientProtocol = AccountSummaryClient()) {
        self.client = client
    }
    
    @MainActor
    func fetchAccountSummary(advisorId: String) async {
        summaries = await client.getAccountSummary(advisorId: advisorId).accounts
    }
}
