//
//  ContentView.swift
//  swiftui_projects-3
//
//  Created by obss on 1.02.2023.
//

import SwiftUI

struct ContentView: View {
    //: MARK: - PROPERTY
    @State private var isAnimating: Bool = false
    @State private var imageScale: CGFloat = 1
    //: MARK: - FUNCTION
    //: MARK: - CONTENT
    
    
    var body: some View {
        NavigationView {
            ZStack{
                //MARK: - PAGE IMAGE
                Image("magazine-front-cover")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
                    .opacity(isAnimating ? 1 : 0)
                    .animation(.linear(duration: 1), value: isAnimating)
                    .scaleEffect(imageScale)
                //MARK: - 1 Tap gesture
                    .onTapGesture(count: 2) { //Tap sayacı
                        if imageScale == 1 {
                            withAnimation(.spring()) {
                                imageScale = 5 //Ölçek büyüten kısım
                            }
                        } else {
                            withAnimation(.spring()) {
                                imageScale = 1 // normal değere tekrar dönüş
                            }
                        }
                    }
                
                //MARK: -
            } //: Zstack
            .navigationTitle("Pinch&Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                withAnimation(.linear(duration: 1)) {
                    isAnimating = true
                }
            }
        } //: NAvigation
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
