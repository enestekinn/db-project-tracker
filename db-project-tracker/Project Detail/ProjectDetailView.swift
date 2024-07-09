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
                        StatBubbleView(title: project.name, stat: "290", startColor: Color("Navy"), endColor:Color("Sky Blue"))
                        StatBubbleView(title: "Session", stat: "34", startColor: Color("Turtle Green"), endColor:Color("Lime"))
                        StatBubbleView(title: "Updates", stat: "32", startColor: Color("Maroon"), endColor:Color("Fuschia"))
                        StatBubbleView(title: "Wins", stat: "9", startColor: Color("Maroon"), endColor:Color("Olive"))
                        Spacer()
                    }
                    Text("My currenct focus is...")
                        .font(.featuredText)
                    
                    HStack{
                        
                        Image(systemName: "checkmark.square")
                        Text("Design the new website")
                            .font(.featuredText)
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
                
                //Project Updates
                ScrollView(showsIndicators: false){
                    
                    VStack(spacing: 27){
                        ProjectUpdateView()
                        ProjectUpdateView()
                        ProjectUpdateView()
                        ProjectUpdateView()
                        ProjectUpdateView()
                    }
                    .padding()
                    .padding(.bottom,80)
                }
            }
                VStack{
                    Spacer()
                    HStack{
                        Button(action: {
                            //Todo: add project update
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
    
}

     
}

