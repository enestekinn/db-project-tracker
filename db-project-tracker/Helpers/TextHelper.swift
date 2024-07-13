//
//  TextHelper.swift
//  db-project-tracker
//
//  Created by Enes Tekin on 13.07.2024.
//

import Foundation


struct TextHelper {
    
    static func convertStat(input: Double) -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 1
        
        switch input {
        case let stat where stat >= 1000:
            // Divide by 1000 and format to 1 decimal place
            let formattedStat = stat / 1000
            return formatter.string(from: NSNumber(value: formattedStat)) ?? "\(formattedStat)k"
            
        default:
            return String(Int(input))
            
        }
    }
    static func limitChars(input: String, limit: Int) -> String {
        
        // If input is above the limit, take the first "limit" number of characters
        if input.count > limit {
            return String(input.prefix(limit))
        }
        return input
    }
}
