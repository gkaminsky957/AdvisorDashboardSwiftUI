//
//  FilterViewCell.swift
//  AdvisorDashboardSwiftUI
//
//  Created by Gennady Kaminsky on 3/29/25.
//

import SwiftUI

struct FilterViewCell: View {
    private var title: String
    @Binding private var selected: Bool
    private var callback: () -> ()
    
    init(title: String,
         selected: Binding<Bool>,
         callback: @escaping () -> () = {}) {
        self.title = title
        self._selected = selected
        self.callback = callback
    }
    
    var body: some View {
        VStack {
            Divider()
            Text(title)
                .foregroundColor(selected ? Color.white : Color.black)
                .padding(.vertical, 10)
            Divider()
        }
        .background(selected ? Color.gray : Color.white)
        .frame(maxWidth: .infinity)
        .onTapGesture {
            if !selected {
                selected.toggle()
                callback()
            }
        }
    }
}

#Preview {
    FilterViewCell(title: "By Name",
                   selected: .constant(true))
}
