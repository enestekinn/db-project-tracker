//
//  ProjectDetailView.swift
//  db-project-tracker
//
//  Created by Enes Tekin on 9.07.2024.
//

import SwiftUI
import SwiftData

struct ProjectDetailView: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    var project: Project

    
    
    @State private var newUpdate: ProjectUpdate?
    @State private var showEditFocus = false
    
    var body: some View {
        
        
        ZStack {
            
            LinearGradient(colors: [Color("Navy"),Color("Wash Blue")], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            LinearGradient(colors: [Color("Wash Blue").opacity(0),Color("Sky Blue")], startPoint: .top, endPoint: .bottom)
                .frame(width: 1)
                .padding(.leading,-150)
            VStack{
                
                //Header
                VStack(alignment: .leading, spacing: 13) {
                    Text(project.name)
                        .font(.screenHeading)
                        .foregroundStyle(.white)
                    
                    HStack(alignment: .center,spacing: 13) {
                        Spacer()
                        StatBubbleView(title: project.name, stat:  project.hours, startColor: Color("Navy"), endColor:Color("Sky Blue"))
                        StatBubbleView(title: "Session", stat: Double(project.sessions), startColor: Color("Turtle Green"), endColor:Color("Lime"))
                        StatBubbleView(title: "Updates", stat: Double(project.updates.count), startColor: Color("Maroon"), endColor:Color("Fuschia"))
                        StatBubbleView(title: "Wins", stat: Double(project.wins), startColor: Color("Maroon"), endColor:Color("Olive"))
                        Spacer()
                    }
                    Text("My currenct focus is...")
                        .font(.featuredText)
                    
                    HStack{
                        if project.focus.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
                            
                            Button {
                                //TODO: Complete tis milestone
                                completeMilestone()
                            }label: {
                                Image(systemName: "checkmark.square")
                            }
                           
                        }
                        Text(project.focus.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? "Tap to set your focus" : project.focus)
                            .font(.featuredText)
                            .onTapGesture{
                                //Display the edit focus form
                                showEditFocus = true
                            }
                    }
                    .padding(.leading)
                }
                .foregroundStyle(.white)
                .padding()
                .background {
                    Color.black
                        .opacity(0.1)
                        .clipShape(.rect(bottomLeadingRadius: 15, bottomTrailingRadius: 15))
                        .ignoresSafeArea()
                    
                }
                if project.updates.count > 0 {
                    //Project Updates
                    ScrollView(showsIndicators: false){
                        
                        VStack(spacing: 27){
                            ForEach(project.updates.sorted(by: {u1, u2 in
                                u1.date > u2.date
                            })){ update in
                                
                                ProjectUpdateView(update: update)
                                    .onTapGesture {
                                        
                                    }
                                    .onLongPressGesture {
                                        newUpdate = update
                                    }
                            }
                        }
                        .padding()
                        .padding(.bottom,80)
                    }
                }else {
                    //No projects updates
                        Spacer()
                        HStack {
                            Button("Tap to add a new project"){
                                newUpdate  = ProjectUpdate()
                            }
                            .buttonStyle(.bordered)
                            .foregroundStyle(.white)
                            .padding(.bottom,100)
                        }
                       
                        Spacer()
                          
                    }
            }
                VStack{
                    Spacer()
                    HStack{
                        Button(action: {
                            //Todo: add project update
                            newUpdate = ProjectUpdate()
                        },label: {
                            ZStack{
                                Circle()
                                    .foregroundStyle(.black)
                                    .frame(width: 65)
                                Image("cross")
                            }
                            
                        })
                        .padding([.leading, .top])
                        
                        Spacer()
                        Button("Back"){
                            dismiss()
                        }
                        .buttonStyle(.borderedProminent)
                        .foregroundStyle(.white)
                        .tint(.black)
                        .padding([.trailing,.top])
                        
                    }
                    .background {
                        Color(.black)
                            .opacity(0.5)
                            .clipShape(.rect(topLeadingRadius: 15,topTrailingRadius: 15))
                            .ignoresSafeArea()
                    }
                    
                    
                }
            }
        .navigationBarBackButtonHidden(true)
        .sheet(item: $newUpdate, content: { update in
            
            let isEdit = update.headline.trimmingCharacters(in: .whitespacesAndNewlines) != ""
            
            EditUpdateView(project: project,update: update,isEditMode: isEdit)
                .presentationDetents([.fraction(0.2)])
        })
        .sheet(isPresented: $showEditFocus, content: {
            EditFocusView(project: project)
                .presentationDetents([.fraction(0.2)])
        })
    
}

    
    func completeMilestone() {
        //Create a new project update for milestone
        let update = ProjectUpdate()
        update.updateType = .milestone
        update.headline = "Milestone Achieved"
        update.summary = project.focus
        
        project.updates.insert(update, at: 0)
        
        // Force a SwiftData save
    try? context.save()
        
        // update stats
        StatHelper.updateAdded(project: project, update: update)
        
        // Clear the project focus
        project.focus = ""
        
        
    }
     
}

