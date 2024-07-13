//
//  StatHelper.swift
//  db-project-tracker
//
//  Created by Enes Tekin on 10.07.2024.
//

import Foundation
import SwiftUI


struct StatHelper {
    
    
    // This method should be run AFTER the new update has been added  to project"s update array
    static func updateAdded(project: Project, update: ProjectUpdate){
        // Cange hours
        project.hours += update.hours
        // Change wins
        if update.updateType == .milestone {
            project.wins += 1
        }
        //Change  sessions
        let sortedUpdates = project.updates.sorted { u1, u2 in
            u1.date  > u2.date
        }
        if sortedUpdates.count >= 2 {
            // Check if the lastest two updates have the same date
            let date1 = sortedUpdates[0].date
            let date2 = sortedUpdates[1].date
            
            if   Calendar.current.isDate(date1, equalTo: date2,toGranularity: .day){
                // if not the same day , then that means latest update is first of today
                project.sessions += 1
            }
        }else {
            // Since there are less than 2 updates, ten this is the first of today
            project.sessions += 1
        }
        
        
        
    }
    // Run this AFTER update has been removed from project updates array
    static func updateDeleted(project: Project, update: ProjectUpdate){
        // Change hours
        project.hours -= update.hours
        // Change wins
        if update.updateType == .milestone {
            project.wins -= 1
        }
        // Change sessions
        let sameDayUpdates = project.updates.filter { u in
            
            Calendar.current.isDate(u.date, inSameDayAs: update.date)
        }
        if sameDayUpdates.count == 0 {
            // That means the deleted update was the only update of that day
            project.sessions -= 1
            
        
        }
    }
    
    static func updateEdited(project: Project, hoursDifference: Double){
        // Change hours
        project.hours += hoursDifference
        
    }
}
