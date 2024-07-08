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
                      
                        VStack(alignment: .leading) {
                            
                            ForEach(projects){ project in
                                NavigationLink(destination: ProjectDetailView(project: project)){
                                    ProjectCardView(project: project)
                                    
                                }
                                .buttonStyle(.plain)
                            
                                
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
        }
        .sheet(item: $newProject) { project in
            AddProjectView(project: project)
                .presentationDetents([.fraction(0.2)])
        }
    }
}
