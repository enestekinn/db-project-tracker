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
                        
                    Button(isEditMode ? "Save" : "Add"){
                        
                        
                        update.headline = headline
                        update.summary = summary
                        update.hours = Double(hours)!
                        
                        if !isEditMode {
                            project.updates.insert(update, at: 0)
                        }
                    
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                    
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
                dismiss()
            }
        }
        .onAppear{
            headline = update.headline
            summary = update.summary
            hours = String(Int(update.hours))
        }

    }
}


