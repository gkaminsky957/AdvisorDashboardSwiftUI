//
//  FilterView.swift
//  AdvisorDashboardSwiftUI
//
//  Created by Gennady Kaminsky on 3/29/25.
//

import SwiftUI

struct FilterView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: AdvisorSummaryViewModel
    
    init(viewModel: AdvisorSummaryViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                FilterViewCell(title: "By Name",
                               selected: $viewModel.byNameFilterSelected) {
                    viewModel.selectFiter(filterType: .byName)
                }
                .padding(.top, 10)
                FilterViewCell(title: "By Asset",
                               selected: $viewModel.byAssetFilterSelected) {
                    viewModel.selectFiter(filterType: .byAssets)
                }
                Spacer()
            }
            .padding(.horizontal)
            .navigationTitle("Filtes")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                if viewModel.shoulShhowRighButton {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        if viewModel.shouldShowSaveButton {
                            Button(action: {
                                viewModel.setFilter()
                                dismiss()
                            }) {
                                Text("Set Filter")
                            }
                        } else {
                            Button(action: {
                                viewModel.resetFilters()
                                dismiss()
                            }) {
                                Text("Reset Filters")
                            }
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        viewModel.cancel()
                        dismiss()
                    }) {
                        Text("Cancel")
                    }
                }
            }
        }
    }
}

#Preview {
    FilterView(viewModel: AdvisorSummaryViewModel())
}
