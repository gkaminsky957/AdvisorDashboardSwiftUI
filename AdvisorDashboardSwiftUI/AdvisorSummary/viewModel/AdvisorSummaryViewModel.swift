//
//  AdvisorSummaryViewModel.swift
//  AdvisorDashboardSwiftUI
//
//  Created by Gennady Kaminsky on 3/26/25.
//

import SwiftUI

class AdvisorSummaryViewModel: ObservableObject {
    @Published var filteredAdvisorSummaries: [AdvisorSummraryWrapper.AdvisorSummraryModel] = []
    
    private var client: AdvisorSummaryClientProtocol
    private var advisorSummaries: [AdvisorSummraryWrapper.AdvisorSummraryModel] = []
    
    init(client: AdvisorSummaryClientProtocol = AdvisorSummaryClient()) {
        
        self.client = client
    }
    
    @MainActor
    func fetchAdvisorSummary() async {
        advisorSummaries = await client.getAdvisorClientSummary().advisors
        filteredAdvisorSummaries = advisorSummaries
    }
    
    func getCustodians(summery: AdvisorSummraryWrapper.AdvisorSummraryModel) -> String {
        var assets = ""
        summery.custodians.forEach {
            assets = assets + "\($0.name), "
        }
        return  String(assets.dropLast(2))
    }
}
