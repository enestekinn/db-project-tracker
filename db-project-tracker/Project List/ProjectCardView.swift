//
//  ProjectCardView.swift
//  db-project-tracker
//
//  Created by Enes Tekin on 8.07.2024.
//

import SwiftUI

struct ProjectCardView: View {
    
    
    var project: Project
    
    var body: some View {
        
        
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: 15)
                .opacity(0.7)
                .shadow(radius: 5, x: 0, y: 4)
            VStack(alignment: .leading,spacing: 10){
                Text(project.name)
                    .font(Font.bigHeadline)
                    .foregroundStyle(.white)
                HStack(alignment: .center,spacing: 13) {
                    Spacer()
                    StatBubbleView(title: project.name, stat: "290", startColor: Color("Navy"), endColor:Color("Sky Blue"))
                    StatBubbleView(title: "Session", stat: "34", startColor: Color("Turtle Green"), endColor:Color("Lime"))
                    StatBubbleView(title: "Updates", stat: "32", startColor: Color("Maroon"), endColor:Color("Fuschia"))
                    StatBubbleView(title: "Wins", stat: "9", startColor: Color("Maroon"), endColor:Color("Olive"))
                    Spacer()
                }
                if project.focus.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
                    Text("My currect focus is...")
                        .font(.featuredText)
                        .foregroundStyle(Color.gray)
                    Text(project.focus)
                        .font(.featuredText)
                        .foregroundStyle(Color.gray)
                        .bold()
                }
                  
            }
            .padding()
        }
    }
}

