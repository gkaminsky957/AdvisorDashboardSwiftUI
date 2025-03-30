//
//  AdvisorSummaryView.swift
//  AdvisorDashboardSwiftUI
//
//  Created by Gennady Kaminsky on 3/26/25.
//

import SwiftUI

struct AdvisorSummaryView: View {
    @StateObject private var viewModel: AdvisorSummaryViewModel = AdvisorSummaryViewModel()
    @State private var shouldGoToAccountView: Bool = false
    @State private var shouldGoToFilterView: Bool = false
    @State private var selectedSummary: AdvisorSummraryWrapper.AdvisorSummraryModel?
    @State private var showPogressView: Bool = true
    
    var body: some View {
        NavigationStack {
            VStack {
                if showPogressView {
                    ProgressView("Laading Data. Please wait...")
                } else {
                    showListView()
                }
            }
            .task {
                await viewModel.fetchAdvisorSummary()
                showPogressView = false
            }
            .navigationTitle("Advisor Summary")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                if viewModel.shouldShowFilterButton {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            shouldGoToFilterView.toggle()
                        }) {
                            Text("Filter")
                        }
                    }
                }
            }
        }
    }
}

private extension AdvisorSummaryView {
    func showListView() -> some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                ForEach(viewModel.filteredAdvisorSummaries, id: \.id) { summary in
                    AdvisorSummaryViewCell(advisorName: summary.name,
                                           assets: viewModel.getCustodians(summery: summary))
                    .padding(10)
                    .onTapGesture {
                        shouldGoToAccountView.toggle()
                        selectedSummary = summary
                    }
                }
            }
        }
        .navigationDestination(isPresented: $shouldGoToAccountView) {
            if let selectedSummary = selectedSummary {
                AccountSummaryView(advisorId: selectedSummary.id)
            } else {
                EmptyView()
            }
        }
        .fullScreenCover(isPresented: $shouldGoToFilterView) {
            FilterView(viewModel: viewModel)
        }
    }
}
    
#Preview {
    AdvisorSummaryView()
}
