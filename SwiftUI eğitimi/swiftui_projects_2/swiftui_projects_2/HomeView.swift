//
//  HomeView.swift
//  swiftui_projects_2
//
//  Created by obss on 27.01.2023.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("isonboarding") var isOnboardingViewActive: Bool = true
    
    var body: some View {
        ZStack{
            VStack {
                //MARK: - HEADER
                ZStack {
                    CircleGroupView(color: .gray, opacity: 0.6)
                    Image("character-2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 380, height: 380, alignment: .center)
                        .padding(40)
                }
                //MARK: - CENTER
               Text("Lorem Ipsum dolor sit amet agubugu bilmem ne bişeyler")
                    .lineSpacing(10)
                    .multilineTextAlignment(.center)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.gray.opacity(0.7))
                    .padding(40)
                //MARK: - FOOTER
                ZStack{
                    Button(action: {
                        isOnboardingViewActive = false
                    })
                    {
                        ZStack {
                            Capsule()
                                .fill(Color("ColorBlue"))
                            .frame(width: 170, height: 70, alignment: .center)
                            HStack {
                                Image(systemName: "arrow.triangle.2.circlepath")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30, alignment: .center)
                                    .foregroundColor(.white)
                                Text("Restart")
                                    .foregroundColor(.white)
                                    .font(.title)
                                .fontWeight(.bold)
                            
                            }
                        }
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
