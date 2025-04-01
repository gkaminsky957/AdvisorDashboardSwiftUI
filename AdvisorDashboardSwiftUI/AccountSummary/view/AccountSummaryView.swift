//
//  AccountSummaryView.swift
//  AdvisorDashboardSwiftUI
//
//  Created by Gennady Kaminsky on 3/27/25.
//

import SwiftUI

struct AccountSummaryView: View {
    @StateObject private var viewModel = AccountSummaryViewModel()
    @State private var showPogressView: Bool = true
    @State private var selectedAccountSummary: AccountSummaryModel.AccountSummary?
    @State private var shouldGoToHoldingView : Bool = false
    
    private var advisorId: String

    init(advisorId: String) {
        self.advisorId =  advisorId
    }
    
    var body: some View {
        VStack {
            if showPogressView {
                ActivityIndicatorView(title: "Loading accounts. Please wait...")
            } else {
                showListView()
            }
        }
        .task {
            if showPogressView {
                await viewModel.fetchAccountSummary(advisorId: advisorId)
                showPogressView.toggle()
            }
        }
        .navigationTitle("Account Summary")
    }
}

private extension AccountSummaryView {
    func showListView() -> some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                ForEach(viewModel.summaries, id: \.id) { summary in
                    AccountSummaryViewCell(name: summary.name,
                                           number: summary.number,
                                           custodian: summary.custodian)
                    .padding(.horizontal, 10)
                    .onTapGesture {
                        shouldGoToHoldingView.toggle()
                        selectedAccountSummary = summary
                    }
                }
            }
            .padding(.top, 10)
        }
        .navigationDestination(isPresented: $shouldGoToHoldingView) {
            if let selectedAccountSummary = selectedAccountSummary {
                HoldingsView(holdings: selectedAccountSummary.holdings.map{ HoldingModel(name: $0.name,
                                                                                         units: $0.units,
                                                                                         price: $0.price)})
            } else {
                EmptyView()
            }
        }
    }
}
#Preview {
    AccountSummaryView(advisorId: "12345")
}
