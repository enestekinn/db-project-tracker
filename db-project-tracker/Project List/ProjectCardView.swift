//
//  ProjectCardView.swift
//  db-project-tracker
//
//  Created by Enes Tekin on 8.07.2024.
//

import SwiftUI

struct ProjectCardView: View {
    
    
    var body: some View {
        
        
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: 15)
                .opacity(0.7)
                .shadow(radius: 5, x: 0, y: 4)
            VStack(alignment: .leading,spacing: 10){
                Text("Cigdosssssssssss")
                    .font(Font.bigHeadline)
                    .foregroundStyle(.white)
                HStack(alignment: .center,spacing: 13) {
                    Spacer()
                   StatBubbleView(title: "Hours", stat: "290", startColor: Color("Navy"), endColor:Color("Blue"))
                    StatBubbleView(title: "Session", stat: "34", startColor: Color("Green"), endColor:Color("Lime"))
                    StatBubbleView(title: "Updates", stat: "32", startColor: Color("Maroon"), endColor:Color("Purple"))
                    StatBubbleView(title: "Wins", stat: "9", startColor: Color("Maroon"), endColor:Color("Olive"))
                    Spacer()
                }
                Text("My currect focus is...")
                    .font(.featuredText)
                    .foregroundStyle(Color.gray)
                Text("Design the new website")
                    .font(.featuredText)
                    .foregroundStyle(Color.gray)
                    .bold()
                  
            }
            .padding()
        }
    }
}

#Preview {
    ProjectCardView()
}
