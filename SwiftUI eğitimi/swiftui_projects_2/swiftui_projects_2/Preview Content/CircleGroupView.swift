//
//  CircleGroupView.swift
//  swiftui_projects_2
//
//  Created by obss on 27.01.2023.
//

import SwiftUI

struct CircleGroupView: View {
    @State var color: Color
    @State var opacity: Double
    @State private var isAnimating: Bool = false
    
    var body: some View {
        
        ZStack {
            
            ZStack{
                Circle()
                    .stroke(color.opacity(opacity), lineWidth: 80)
                    
                    .frame(width: 260, height: 260, alignment: .center)
                
                Circle()
                    .stroke(color.opacity(opacity), lineWidth: 40)
                    .frame(width: 260, height: 260, alignment: .center)
            }
            
            .blur(radius: isAnimating ? 0 : 10)
            .opacity(isAnimating ? 1 : 0)
            .scaleEffect(isAnimating ? 1 : 0.5)
            .animation(.easeOut(duration: 1), value: isAnimating)
            .onAppear {
                isAnimating = true
            }
        }
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges:.all)
            
            CircleGroupView(color: .white, opacity: 0.2)
        }
    }
}
