//
//  ContentView.swift
//  swiftui_projects_2
//
//  Created by obss on 27.01.2023.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isonboarding") var isOnboardingViewActive: Bool = true
    
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
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
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                    Capsule()
                        .fill(Color.white.opacity(0.4))
                        .padding(8)
                    
                    //ACTIONS
                    Text("Get Started")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundColor(.white.opacity(0.8))
                        .offset(x: 20)
                    
                    //Capsule dinamik
                    HStack{ //kırmızı butonun yapılması
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: buttonOffset + 80)
                        
                        Spacer() // kırmızı butonu sola yapıştırmak için yaptık.
                    }
                    //Sürüklenecek olan yuvarlaklar
                    HStack {
                        ZStack{ //slide butonun animasyon yapan kısmı.
                            Circle()
                                .fill(Color("ColorRed"))
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                                
                            Spacer()
                        }
                        .foregroundColor(.white)
                    .frame(width: 80, height: 80, alignment: .center)
                    .offset(x: buttonOffset)
                        //alanın tamamı içinde yer alabilecek olan yuvarlak ile bir fonksiyon yapacağımız için buton değil, tap gesture verdik.
                        
                    .gesture( // tek seferlik olacak bir animasyon, aynı zamanda bir fonksiyon olarak gesture ekledik. 
                    DragGesture() //Sürüklenebilir olan gesture classını çağırdık
                        .onChanged{ gesture in //onChanged ile verinin değiştiğinden haberdar olduk.
                            if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80 { //gesture solda sıfır alıyor, sağa en ufak hareketinde if fonksiyonu kontrol ediliyor eğer 0 üsütnde bir değerse zaten kaydırılmanın başladığı anlamına geliyor ve içindeki döngüyü çalıştırıyor.
                                buttonOffset = gesture.translation.width // kodun en üsütne tanımladığımız buttonOffset değişkeninin değerini sürekli güncelliyor.
                            }  //gesture için değer her değiştiğinde bize burada bi closure ile fonksiyon yaratacak.
                        }
                        .onEnded({ _ in // drag işlemi bırakıldığı anda offseti 0lıyor
                            if buttonOffset > buttonWidth / 2 {
                                buttonOffset = buttonWidth - 80
                                    isOnboardingViewActive = true
                            } else {
                                buttonOffset = 0
                            }
                        })
                    
                    
                    )   //: Gesture
                        
                        Spacer() //HStack içine eklediğimiz zstack'i spacer ile sola yasladık.
                    }
                }
                .frame(width: buttonWidth, height: 80, alignment: .center)
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
