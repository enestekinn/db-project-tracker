//
//  ContentView.swift
//  db-project-tracker
//
//  Created by Enes Tekin on 7.07.2024.
//

import SwiftUI
import SwiftData

struct ProjectListView: View {
    
    @State private var newProject: Project?
    
    @Query private var projects:[Project]
    @State private var taoCount: Int  = 0
    @State private var showProjectDetail: Bool  = false
    @State private var selectedProject: Project?
    
    var body: some View {
        
     
        NavigationStack {
            ZStack {
              
                LinearGradient(colors: [Color("Deep Purple"),Color("Blush Pink")], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    Text("Projects")
                        .font(Font.screenHeading)
                        .foregroundStyle(.white)
                    
                 
                    ScrollView(showsIndicators: false) {
                      
                        VStack(alignment: .leading,spacing: 26) {
                            
                            ForEach(projects){ project in
                               
                                ProjectCardView(project: project)
                                    .onTapGesture {
                                        selectedProject = project
                                    }
                                    .onLongPressGesture(perform: {
                                        newProject  = project
                                    })
                                 
                    
                             
                                
                            }
                            
                            
                        }
                        
                    }
                    
                }
                .padding()
                VStack {
                    Spacer()
                    HStack{
                        Button(action: {
                            //Create new project
                            
                            self.newProject  = Project()
                            
                        }, label: {
                            
                            ZStack {
                                Circle()
                                    .frame(width: 65)
                                    .foregroundColor(.black)
                                Image("cross")
                            }
                        })
                        Spacer()
                    }
                }
                .padding(.leading)
            }
            .navigationDestination(item: $selectedProject) { project in
                ProjectDetailView(project: project)
            }
        }
        .sheet(item: $newProject) { project in

            
            let isEdit = project.name.trimmingCharacters(in: .whitespacesAndNewlines) != ""
            
            EditProjectView(project: project,isEditMode: isEdit)
                .presentationDetents([.fraction(0.2)])
        }
    }
}
