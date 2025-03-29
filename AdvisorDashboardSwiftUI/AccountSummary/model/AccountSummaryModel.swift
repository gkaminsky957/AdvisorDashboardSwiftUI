//
//  AccountSummaryModel.swift
//  AdvisorDashboardSwiftUI
//
//  Created by Gennady Kaminsky on 3/27/25.
//

struct AccountSummaryModel: Decodable {
    var accounts: [AccountSummary]
    
    struct AccountSummary: Decodable {
        var name: String
        var number: String
        var id: String
        var holdings: [Holding]
        var custodian: String
        
        enum CodingKeys: String, CodingKey {
            case name
            case id = "repId"
            case holdings
            case custodian
            case number
        }
        
        struct Holding: Decodable {
            var name: String
            var units: Int
            var price: Double
            
            enum CodingKeys: String, CodingKey {
                case name = "ticker"
                case units
                case price = "unitPrice"
            }
        }
    }
}

