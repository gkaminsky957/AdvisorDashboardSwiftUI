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
    @Published var byNameFilterSelected: Bool = false
    @Published var byAssetFilterSelected: Bool = false
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
    
    func selectFiter(filterType: FilterType) {
        shoulShhowRighButton = true
        if filterType == .byName {
            byAssetFilterSelected = false
            if currentUserFilterSelection != .byName {
                shouldShowSaveButton = true
            } else {
                shouldShowSaveButton = false
            }
        }
        
        if filterType == .byAssets {
            byNameFilterSelected = false
            if currentUserFilterSelection != .byAssets {
                shouldShowSaveButton = true
            } else {
                shouldShowSaveButton = false
            }
        }
    }
    
    func cancel() {
        if currentUserFilterSelection == .byName && byNameFilterSelected == false {
            byNameFilterSelected = true
            byAssetFilterSelected = false
        } else if currentUserFilterSelection == .byAssets && byAssetFilterSelected == false {
            byAssetFilterSelected = true
            byNameFilterSelected = false
        } else if currentUserFilterSelection == .none {
            byAssetFilterSelected = false
            byNameFilterSelected = false
            shoulShhowRighButton = false
        }
    }
}
