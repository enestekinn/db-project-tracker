//
//  AddUpdateView.swift
//  db-project-tracker
//
//  Created by Enes Tekin on 10.07.2024.
//

import SwiftUI

struct AddUpdateView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    var project: Project
    var update: ProjectUpdate
    
    
    @State private var headline: String  = ""
    @State private var summary: String  = ""
    @State private var hours: String  = ""

    var body: some View {
        
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(alignment: .leading){
                Text("New Update")
                    .font(.bigHeadline)
                    .foregroundStyle(.white)
                
                    TextField("Headline",text: $headline)
                    
                    
                TextField("Summary",text: $summary, axis: .vertical)
                        
                HStack{
                    TextField("Hours",text: $hours)
                        .keyboardType(.numberPad)
                        .frame(width: 60)
                        
                    Button("Save"){
                        // Save Project update
                        update.headline = headline
                        update.summary = summary
                        update.hours = Double(hours)!
                        project.updates.append(update)
                    
                        
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                    
                }
                
                Spacer()
            }
            .textFieldStyle(.roundedBorder)
            .padding([.horizontal,.top])
            
            
        }

    }
}


