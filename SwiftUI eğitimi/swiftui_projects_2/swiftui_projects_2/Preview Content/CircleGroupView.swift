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
