//
//  AdvisorSummraryModel.swift
//  AdvisorDashboardSwiftUI
//
//  Created by Gennady Kaminsky on 3/26/25.
//

import Foundation

struct AdvisorSummraryWrapper: Decodable {
    var advisors: [AdvisorSummraryModel]
    
    struct AdvisorSummraryModel: Decodable {
        static func == (lhs: AdvisorSummraryWrapper.AdvisorSummraryModel, rhs: AdvisorSummraryWrapper.AdvisorSummraryModel) -> Bool {
            return true
        }
        
        var name: String
        var id: String
        var custodians: [Custodian]
        
        struct Custodian: Decodable {
            var name: String
            var id: String
            
            enum CodingKeys: String, CodingKey {
                case name
                case id = "repId"
            }
        }
    }
}

