//
//  ContentView.swift
//  db-project-tracker
//
//  Created by Enes Tekin on 7.07.2024.
//

import SwiftUI

struct ProjectListView: View {
    var body: some View {
        VStack {
            Image("cross")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .font(Font.screenHeading)
                .foregroundColor(Color("Olive"))
        }
        .padding()
    }
}

#Preview {
    ProjectListView()
}
