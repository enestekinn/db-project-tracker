//
//  StatBubbleView.swift
//  db-project-tracker
//
//  Created by Enes Tekin on 8.07.2024.
//

import SwiftUI

struct StatBubbleView: View {
    
    var title: String
    var stat: Double
    var startColor: Color
    var endColor: Color
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(
            LinearGradient(colors: [startColor,endColor], startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            VStack {
                Text(title)
                    .font(Font.captionText)
                    .bold()
                Text(TextHelper.convertStat(input: stat))
                    .contentTransition(.numericText())
                    .font(.featuredNumber)
                    .bold()
            }
            .foregroundStyle(.white)
        }
        .frame(width: 60,height: 40)
    }
}

