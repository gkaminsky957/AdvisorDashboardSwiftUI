//
//  AdvisorSummaryClient.swift
//  AdvisorDashboardSwiftUI
//
//  Created by Gennady Kaminsky on 3/26/25.
//
import Foundation

protocol AdvisorSummaryClientProtocol {
    func getAdvisorClientSummary() async -> AdvisorSummraryWrapper
}

class AdvisorSummaryClient: AdvisorSummaryClientProtocol {
    func getAdvisorClientSummary() async -> AdvisorSummraryWrapper {
        // Since there is no real API exists,
        // I am reading mock response here and parse it out as I would if I were to make real network call using
        // URLSession object that I would inject in this client in production application.
        
        do
        {
            try await Task.sleep(nanoseconds: 2000000000)
        } catch {
            
        }
        
        let filePath = Bundle.main.url(forResource: "MockAdvisorResponse", withExtension: "")!
        let data = try! Data(contentsOf: filePath)
        
        let decoder = JSONDecoder()
        return try! decoder.decode(AdvisorSummraryWrapper.self, from: data)
    }
}
