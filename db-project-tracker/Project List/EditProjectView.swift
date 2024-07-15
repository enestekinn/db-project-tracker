//
//  AddProjectView.swift
//  db-project-tracker
//
//  Created by Enes Tekin on 8.07.2024.
//

import SwiftUI
import SwiftData

struct EditProjectView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    var project: Project
    @State private var projectName: String  = ""
    @State private var showConfirmation: Bool  = false
    
    var isEditMode: Bool
    
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                Text(isEditMode ? "Edit Project" : "Add Project")
                    .font(.bigHeadline)
                    .foregroundStyle(.white)
                HStack {
                    TextField("Project name",text: $projectName)
                        .textFieldStyle(.roundedBorder)
                        .onChange(of: projectName){ oldValue , newValue in
                            TextHelper.limitChars(input: projectName, limit: 30)
                        }
                    
                    Button(isEditMode ? "Save" : "Add"){
                        
                        if isEditMode {
                            //Save the new project name
                            
                            project.name = projectName
                        }else {
                            withAnimation{
                                // Add project to SwiftData
                                project.name = projectName
                                context.insert(project)
                                
                                try? context.save()
                            }
                        }
                        
                        dismiss()
                        
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                    .disabled(projectName.trimmingCharacters(in: .whitespacesAndNewlines) == "" )
                    
                    if isEditMode {
                        //Show delete button
                        Button("Delete") {
                            //Todo
                       showConfirmation = true
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.red)
                    }
                }
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top)
        }
        .confirmationDialog("Really delete?", isPresented: $showConfirmation,titleVisibility: .visible){
            Button("Yes, delete it"){
                withAnimation{
                    //Delete project from Swiftdata
                    context.delete(project)
                    dismiss()
                }
            }
        }
        .onAppear {
            projectName = project.name
        }
    }
        
}
