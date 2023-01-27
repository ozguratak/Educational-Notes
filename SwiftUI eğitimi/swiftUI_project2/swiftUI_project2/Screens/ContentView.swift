//
//  ContentView.swift
//  swiftUI_project2
//
//  Created by obss on 25.01.2023.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true //Swift’in Foundation Kütüphanesinden alışık olduğumuz ve uygulamamızda kullandığımız ufak çaptaki verilerimizi lokal depolama alanına kayıt etmemizi sağlayan UserDefaults özelliğini SwiftUI özellikleriyle harmanlanmış bir şekilde karşımıza çıkıyor. Genel olarak özelliklerine bakacak olursak UserDefaults ile aynı işlemleri yapmasının yanı sıra bu işlemleri yaparken @State özelliğinide kazandırmış oluyoruz.
    

    var body: some View {
        ZStack{ // SwiftUI Kütüphanesinde ekranda birden fazla içeriklerin görünümlerini ayarlanmasını sağlayan özeliktir. Stack, UIKit’teki UIStackView’e eşdeğerdir. Üç biçimde gelir: Yatay(VStack), Dikey (HStack) ve Derin tabanlı(ZStack). Swift'deki stacView'ın aynısı aslında
            if isOnboardingViewActive{
                OnboardingView()
            } else {
                HomeView()
            }
        }
    }
    
 
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
