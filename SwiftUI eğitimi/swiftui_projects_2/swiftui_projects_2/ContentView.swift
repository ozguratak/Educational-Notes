//
//  ContentView.swift
//  swiftui_projects_2
//
//  Created by obss on 27.01.2023.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isonboarding") var isOnboardingViewActive: Bool = true
    var body: some View {
        
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all,edges: .all)
            VStack {
                //MARK: -HEADER
                Text("SHARE")
                    .font(.system(size: 40, weight: .bold, design: .default))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("""
                     Lorem Ipsum Dolor Amet ile bşalayan cümlelere lorem ipsum denir.
                     """)
                .multilineTextAlignment(.center)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .foregroundColor(.white)
                .padding(10)
                
                Spacer()
                //MARK: -CENTER
                ZStack {
                    CircleGroupView(color: .white, opacity: 0.2)
                    
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 380, height: 380, alignment: .center)
                    
                    
                    
                }
                
                
                //MARK: -FOOTER
                
                ZStack{
                    Button(action: {
                        isOnboardingViewActive = true
                    })
                    {
                        ZStack {
                            Capsule()
                                .fill(Color("ColorRed").opacity(0.6))
                                .frame(width: 380, height: 100, alignment: .center)
                            Capsule()
                                .fill(Color("ColorRed").opacity(0.6))
                                .frame(width: 360, height: 80, alignment: .center)
                            
                            ZStack {
                                Button(action: {
                                    //someactions
                                })
                                {
                                    ZStack {
                                        
                                        Circle()
                                            .fill(.white.opacity(0.7))
                                            .frame(width: 90, height: 90, alignment: .center)
                                        Circle()
                                            .fill(Color("ColorRed"))
                                            .frame(width: 80, height: 80, alignment: .center)
                                        Image(systemName: "arrowshape.right.fill")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 40, height: 40, alignment: .center)
                                            .foregroundColor(.white.opacity(0.8))
                                    }
                                }
                            }
                        }
                    }
                    
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
