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
    @State private var imageOffset: CGSize = CGSize(width: 0, height: 0) // burada kısa bir yol olarak CGSize değerini 0,0 olarak vermek yerine direkt .zero atabiliriz
    //: MARK: - FUNCTION
    
    func resetImageState() {
        return withAnimation(.spring()) {
            imageScale = 1
            imageOffset = .zero
        }
    }
    //: MARK: - CONTENT
    
    
    var body: some View {
        NavigationView {

            ZStack{
                Color.clear
                //MARK: - PAGE IMAGE
                Image("magazine-front-cover")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
                    .opacity(isAnimating ? 1 : 0)
                    .offset(x: imageOffset.width, y: imageOffset.height)
                    .animation(.linear(duration: 1), value: isAnimating)
                    .scaleEffect(imageScale)
                //MARK: - 1 TAP GESTURE
                    .onTapGesture(count: 2) { //Tap sayacı
                        if imageScale == 1 {
                            withAnimation(.spring()) {
                                imageScale = 5 //Ölçek büyüten kısım
                            }
                        } else {
                            resetImageState() // daha önce imageScale değerini 1 olarak update ediyor ve sıfırlıyorduk fakat uygulama geliştikçe yeni featurelar gereksinimi ile fonksiyon daha clear bir metod oluyor. ayrıca kodun farklı yerlerinde tekrara düşmemek içinde bunu kullanıyoruz. gesture onEnded metodu içinde de aynı gereksinimlere ihtiyacımız var.
                            
                        }
                    }
                //MARK: - 2 TAP GESTURE
                //İmage'ın kullanıcı tarafından sürüklenebilir olmasını sağlamak için eklenen skill
                
                    .gesture(
                        DragGesture()
                            .onChanged { value in                   // sürükleme hareketi algılandığında
                                withAnimation(.linear(duration: 1)) {
                                    imageOffset = value.translation
                                }
                            }
                        
                            .onEnded({ _ in                         //sürükleme işlemi bırakıldığında
                                if imageScale <= 1{
                                    resetImageState()
                                }
                            })
                       
                    )
          
                
            } //: Zstack
            .navigationTitle("Pinch&Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                withAnimation(.linear(duration: 1)) {
                    isAnimating = true
                }
            }
            
            //MARK: - INFO PANEL
            
            .overlay(InfoPanelView(scale: imageScale, offset: imageOffset) , alignment: .top)
            .padding(.horizontal)
            .padding(.top, 30)
        } //: NAvigation
        .navigationViewStyle(.stack)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
