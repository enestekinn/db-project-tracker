//
//  ProjectUpdateView.swift
//  db-project-tracker
//
//  Created by Enes Tekin on 9.07.2024.
//

import SwiftUI

struct ProjectUpdateView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundStyle(.black)
                .shadow(radius: 5,x: 0, y:4)
            VStack(alignment: .leading, spacing: 10) {
                HStack{
                    Text("Thursday, September 12, 2023")
                        .padding(.leading)
                    Spacer()
                    Text("9 Hours")
                        .padding(.trailing)
                }
                .padding(.vertical,5)
                .background{
                    Color("Orchid")
                }
                Text("Project headline")
                    .font(.smallHeadline)
                    .padding(.horizontal)
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ut neque ac leo condimentum tristique. Fusce convallis posuere nisi, non suscipit eros aliquam vel. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Ut vitae odio eros")
                    .padding(.horizontal)
                    .padding(.bottom)
            }
         
            .foregroundStyle(.white)
            .font(.regularText)
            
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))

    }
}

#Preview {
    ProjectUpdateView()
}
