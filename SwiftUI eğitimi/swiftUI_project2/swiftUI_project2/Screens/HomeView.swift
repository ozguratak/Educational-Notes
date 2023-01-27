//
//  HomeView.swift
//  swiftUI_project2
//
//  Created by obss on 25.01.2023.
//

import SwiftUI


struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    var body: some View {
       
        VStack(spacing: 20) {
            //MARK: - HEADER
            Spacer()
            ZStack {
                CircleGroupView(shapeColor: .gray, shapeOpacity: 0.2)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding(20)
            }
                
            
            //MARK: - CENTER
            VStack{
                Text("MOTIVATION")
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                    .padding(10)
                    
                
                Text("Lorem Ipsum dolor amet diye giden metinler Lorem Ipsum olarak geçer.")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.gray.opacity(0.6))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
            }
            
            
            Spacer()
            
            //MARK: - FOOTER
          
            Button(action: {
                isOnboardingViewActive = true
            })
            {
                ZStack{
                    Capsule()
                        .fill(Color("ColorBlue"))
                        .frame(width: 150.0,height: 50.0)
                    HStack{
                        Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                            .foregroundColor(.white)
                        Text("Restart")
                            .font(.title3)
                            .fontWeight(.light)
                            .foregroundColor(.white)
                    }
                }
               
            }
            
            //:END OF FOOTER
        } //: Vtack
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
