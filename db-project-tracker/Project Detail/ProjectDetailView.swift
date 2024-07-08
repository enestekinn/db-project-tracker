//
//  ProjectDetailView.swift
//  db-project-tracker
//
//  Created by Enes Tekin on 9.07.2024.
//

import SwiftUI

struct ProjectDetailView: View {
    
    var project: Project
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        Text("hello world")
            .navigationBarBackButtonHidden()
        
        Button("Back"){
            
            dismiss()
            
        }
    }
}

