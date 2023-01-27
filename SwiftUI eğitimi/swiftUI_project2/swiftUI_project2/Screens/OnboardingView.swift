//
//  OnboardingView.swift
//  swiftUI_project2
//
//  Created by obss on 25.01.2023.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80 // Tüm ekranlarda butonun genişliğini deafult olarak setlemesi için bir private değişken atadık. Kod, herhangi bir iOS cihazda çalıştığı anda default olarak kendini setleyecek.
    
    var body: some View { 
        ZStack { //ZStack, Ekran hierarşisine göre üs tüste componentler dizmemize yardımcı oluyor.
            Color("ColorBlue") // ilk aşama arkaplan rengini belirlemek
                .ignoresSafeArea(.all, edges: .all) //arkaplan rengini tüm ekrana uyguladık.
            VStack(spacing: 20) { //Bildiğimiz vertical stack view için default spacing verdik böylece hard coded bir view ekranı yapabiliyoruz. her bir komponent arasına 20 px boşluk atarak komponentlerimizi diziyor.
              //MARK: - HEADER
                Spacer()
                VStack(spacing: 0) {
                    Text("SHARE") //ana başlık içeriği yazıldı
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    
                    Text("""
                         Its not hove much bişeyler bilmiyon bişeyler.
                         """) // subtitle yazıldı.
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)//Vstack içerisine header kısmına gelecek biçimde verilerimizi setledik. kapatmak için option + cmd + sol ok bas.
                }
               
                    .padding(10)
                //MARK: - CENTER
                ZStack() {
                    ZStack(){
                        CircleGroupView(shapeColor: .white, shapeOpacity: 0.2)
                        
                        Image("character-1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 400 ,height: 400, alignment: .center)
                            
                    }
                } //: CENTER END
                Spacer()
                //MARK: - FOOTER
                ZStack(){
                    //1. Custom button parts
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                    Capsule()
                        .fill(Color.red.opacity(0.2))
                        .padding(8)
                    
                    //2. background
                    Text("Get started")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x: 20)
                    //3. Call to action
                    HStack{
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: 80)
                        
                        Spacer()
                    }
                    
                    //Capsule(Dynamic width)
                    HStack {
                        ZStack{
                            Circle()
                                .fill(Color("ColorRed"))
                            Circle()
                                .fill(Color.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .heavy, design: .default))
                            
                        } //: Zstack
                        .foregroundColor(.white)
                    .frame(width: 80, height: 80, alignment: .center)
                    .onTapGesture {
                        isOnboardingViewActive = false
                    }
                        
                        Spacer()
                    }
                    
                    //Circle(draggable)
                    
                }//FOOTER END
                .frame(height: 80, alignment: .center)
                .padding()
            }//:VSTACK
        }//:ZSTACK
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
