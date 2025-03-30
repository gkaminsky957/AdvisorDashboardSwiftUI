//
//  AdvisorSummaryViewModel.swift
//  AdvisorDashboardSwiftUI
//
//  Created by Gennady Kaminsky on 3/26/25.
//

import SwiftUI

enum FilterType: String {
    case none = ""
    case byName = "By Name"
    case byAssets = "By Assets"
}

class AdvisorSummaryViewModel: ObservableObject {
    @Published var filteredAdvisorSummaries: [AdvisorSummraryWrapper.AdvisorSummraryModel] = []
    @Published var shouldShowFilterButton: Bool = false
    @Published var byNameFilterSelected: Bool = false {
        willSet {
            if newValue {
                byAssetFilterSelected = false
                shouldShowSaveButton = currentUserFilterSelection == .byAssets ||
                                      currentUserFilterSelection == .none
            }
            
            shoulShhowRighButton = true
        }
    }
    
    @Published var byAssetFilterSelected: Bool = false {
        willSet {
            if newValue {
                byNameFilterSelected = false
                shouldShowSaveButton = currentUserFilterSelection == .byName || currentUserFilterSelection == .none
            }
            shoulShhowRighButton = true
            
        }
    }
    
    @Published var shouldShowSaveButton: Bool = false
    @Published var shoulShhowRighButton: Bool = false
    
    private var currentUserFilterSelection: FilterType = .none
    private var client: AdvisorSummaryClientProtocol
    private var advisorSummaries: [AdvisorSummraryWrapper.AdvisorSummraryModel] = []
    
    init(client: AdvisorSummaryClientProtocol = AdvisorSummaryClient()) {
        self.client = client
    }
    
    @MainActor
    func fetchAdvisorSummary() async {
        advisorSummaries = await client.getAdvisorClientSummary().advisors
        filteredAdvisorSummaries = advisorSummaries
        shouldShowFilterButton = !filteredAdvisorSummaries.isEmpty
    }
    
    func getCustodians(summery: AdvisorSummraryWrapper.AdvisorSummraryModel) -> String {
        var assets = ""
        summery.custodians.forEach {
            assets = assets + "\($0.name), "
        }
        return  String(assets.dropLast(2))
    }
    
    func resetFilters() {
        byNameFilterSelected = false
        byAssetFilterSelected = false
        currentUserFilterSelection = .none
        filteredAdvisorSummaries = advisorSummaries
    }
    
    func setFilter() {
        if byNameFilterSelected {
            currentUserFilterSelection = .byName
            filteredAdvisorSummaries = advisorSummaries.sorted { $0.name <  $1.name }
        } else if byAssetFilterSelected {
            currentUserFilterSelection = .byAssets
            filteredAdvisorSummaries = advisorSummaries.sorted { $0.custodians.count > $1.custodians.count }
        } else {
            // shouldn't happen
            currentUserFilterSelection = .none
            filteredAdvisorSummaries = advisorSummaries
        }
    }
}
