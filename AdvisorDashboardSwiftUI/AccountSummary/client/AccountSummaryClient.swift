//
//  AccountSummaryClient.swift
//  AdvisorDashboardSwiftUI
//
//  Created by Gennady Kaminsky on 3/27/25.
//

import Foundation

protocol AccountSummaryClientProtocol {
    func getAccountSummary(advisorId: String) async -> AccountSummaryModel
}

class AccountSummaryClient: AccountSummaryClientProtocol {
    
    func getAccountSummary(advisorId: String) async -> AccountSummaryModel {
        // Assumption here is that advisor id will be sent in API request as a cusotm HTTP header so all accounts
        // that the advisor handles will be fetched. Since there is no real API exists,
        // I am reading mock response here and parse it out as I would if I were to make real network call using
        // URLSession object that I would inject in this client in production application.
        
        do {
            try await Task.sleep(nanoseconds: 2000000000)
        } catch {
            
        }
        
        let filePath = Bundle.main.url(forResource: "MockAccountSummaryResponseRepId\(advisorId)", withExtension: "")!
        let data = try! Data(contentsOf: filePath)
        
        let decoder = JSONDecoder()
        return try! decoder.decode(AccountSummaryModel.self, from: data)
    }
}
