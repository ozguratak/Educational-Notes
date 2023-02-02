//
//  InfoPanelView.swift
//  swiftui_projects-3
//
//  Created by obss on 2.02.2023.
//

import SwiftUI

struct InfoPanelView: View {
    var scale: CGFloat
    var offset: CGSize
    
    @State private var isInfoPanelvisibale: Bool = true
    
    
    var body: some View {
        HStack{
            //MARK: - HOTSPOT
            Image(systemName: "circle.circle")
                .symbolRenderingMode(.hierarchical)
                .resizable()
                .frame(width: 30, height: 30)
            
                .onLongPressGesture(minimumDuration: 1) {
                    withAnimation(.easeOut) {
                        isInfoPanelvisibale.toggle()
                    }
                }
            
            Spacer()
            
            //MARK: - INFO PANEL
            
            HStack(spacing: 2){
                Image(systemName: "arrow.up.left.and.arrow.down.right")
                Text("\(scale)")
                
                Spacer()
                
                Image(systemName: "arrow.left.and.right")
                Text("\(offset.width)")
                
                Spacer()
                
                Image(systemName: "arrow.up.and.down")
                Text("\(offset.height)")
                
                Spacer()
            }
            
        }
        .font(.footnote)
        .padding(10)
        .backgroundStyle(.ultraThinMaterial)
        .cornerRadius(8)
        .frame(width: 420)
        .opacity(isInfoPanelvisibale ? 1 : 0.2)
        
        Spacer()
    }
}

struct InfoPanelView_Previews: PreviewProvider {
    static var previews: some View {
        InfoPanelView(scale: 1, offset: .zero)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
