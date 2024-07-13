//
//  AddUpdateView.swift
//  db-project-tracker
//
//  Created by Enes Tekin on 10.07.2024.
//

import SwiftUI

struct EditUpdateView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    var project: Project
    var update: ProjectUpdate
    var isEditMode: Bool

    
    
    @State private var headline: String  = ""
    @State private var summary: String  = ""
    @State private var hours: String  = ""
    @State private var showConfirmation: Bool  = false

    var body: some View {
        
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(alignment: .leading){
                Text(isEditMode ? "Edit Update" : "New Update")
                    .font(.bigHeadline)
                    .foregroundStyle(.white)
                
                    TextField("Headline",text: $headline)
                    
                    
                TextField("Summary",text: $summary, axis: .vertical)
                        
                HStack{
                    TextField("Hours",text: $hours)
                        .keyboardType(.numberPad)
                        .frame(width: 60)
                        .onChange(of: hours){oldValue, newValue in
                            let num  = Int(TextHelper.limitChars(input: hours, limit: 2)) ?? 0
                            hours = num > 24 ? "24" : String(num)
                            
                        }
                        
                    Button(isEditMode ? "Save" : "Add"){
                        
                        // keep track of the difference in hours for an edit update
                        let hoursDifference = update.hours - Double(hours)!
                        
                        update.headline = headline
                        update.summary = summary
                        update.hours = Double(hours)!
                        
                        if !isEditMode {
                            // Add PRoject Update
                            project.updates.insert(update, at: 0)
                            
                            
                                // Force a SwiftData save
                            try? context.save()
                            
                            // Update stats
                            StatHelper.updateAdded(project: project, update: update)
                        }
                        else {
                            // Edit Project Update
                            //Update Stats
                            StatHelper.updateEdited(project: project, hoursDifference: hoursDifference)
                            
                        }
                    
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                    .disabled(shouldDisable())
                    
                    if isEditMode {
                        Button("Delete"){
                            // Show confirmation dialog
                            showConfirmation = true
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.red)
                    }
                    
                }
                
                Spacer()
            }
            .textFieldStyle(.roundedBorder)
            .padding([.horizontal,.top])
            
            
        }
        .confirmationDialog("Really delete the update?", isPresented: $showConfirmation) {
            Button("Yes, delete it"){
                
                // Remove all updates from the prohect with the same id
                project.updates.removeAll { u in
                    
                    u.id == update.id
                    
                }
                //Force a SwiftData save
                try? context.save()
                
                // Delete updates
                StatHelper.updateDeleted(project: project, update: update)
                
                
                dismiss()
            }
        }
        .onAppear{
            headline = update.headline
            summary = update.summary
            hours = String(Int(update.hours))
        }

    }
    private func shouldDisable() -> Bool {
        // If headline or summary or hours is empty, then disable saving it
        return headline.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
        summary.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
        hours.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        
    }
}


