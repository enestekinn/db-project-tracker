//
//  ContentView.swift
//  db-project-tracker
//
//  Created by Enes Tekin on 7.07.2024.
//

import SwiftUI

struct ProjectListView: View {
    var body: some View {
        
        ZStack {
            LinearGradient(colors: [Color("Deep Purple"),Color("Blush Pink")], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                Text("Projects")
                    .font(Font.screenHeading)
                    .foregroundStyle(.white)
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading) {
                        
                        ProjectCardView()
                        ProjectCardView()
                        ProjectCardView()
                        ProjectCardView()
                        ProjectCardView()
                        
                     
                    }
                        
                }
             
            }
            .padding()
            VStack {
                Spacer()
                HStack{
                    Button(action: {
                        //action
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
}
#Preview {
    ProjectListView()
}
