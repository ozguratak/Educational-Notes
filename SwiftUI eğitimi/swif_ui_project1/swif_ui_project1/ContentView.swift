//
//  ContentView.swift
//  swif_ui_project1
//
//  Created by obss on 25.01.2023.
//

import SwiftUI


extension Image {
    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    
    func iconModifier() -> some View {
        self
            .imageModifier()
        .frame(maxWidth: 200)
        .foregroundColor(.purple)
        .opacity(0.5)
    }
}

@available(iOS 16.0, *)
struct ContentView: View {
    private let imageURL: String = "https://www.thecocktaildb.com/images/media/drink/xspupx1441248014.jpg"
    var body: some View {
        //MARK: - Asynchroneus Image Set
//                AsyncImage(url: URL(string: imageURL))
        //MARK: - IamgeScaling
//                    AsyncImage(url: URL(string: imageURL), scale: 2.0)
        //MARK: - Placeholder
/*                AsyncImage(url: URL(string: imageURL), scale: 2.0) { image in
                    image
                } placeholder: {
                    Image("appIcon")
                    Image(systemName: "eye").scaleEffect(5.0)
        
                }
                .padding(40)    */
        
        //MARK: - Customize Placeholder
 /*       AsyncImage(url: URL(string: imageURL), scale: 2.0) { image in
            image.imageModifier()
            image.iconModifier()
            // Bu kısımda eğer image değikeni birden fazla sefer çağrılırsa çağırı sayısı kadar ekranda image oluşturur. Örneğin; image ve image. modifier olarak ifade edersek bir normal image birde modifier edilmiş image görseli ekrana basılır.
        } placeholder: {
            Image(systemName: "eye").iconModifier()
            Image(systemName: "fish").imageModifier()
            //Bu kısımda ise belirttiğimiz .iconModifier() fonksiyonu image ile ilgili gerekli sizing ve renklendirme gibi işlemleri yapar. buna bağlı olarak hızlı bir şekilde istenilen görsellere behaviourları kazandırır. yukarıdaki ifadede 2 adet image tanımlı fakat birisi default iken diğeri bizimb elirttiğimiz özelliklere göre yendien düzenlenmiş duurmda
        }
        .padding(40)
        */
        
        //MARK: - PHASE
        
/*        AsyncImage(url: URL(string: imageURL)) { phase in
            /* Burada 3 farklı aşama tnaımlamaız gerekiyor bunlar 1 başarılı, 2 error, 3 nil olacak biçimde image yükleme prosesinin statelerini ifade edecek
             */
            
            if let image = phase.image {
                image.imageModifier()
            } else if phase.error != nil {
                Image(systemName: "star").iconModifier()
            } else {
                Image(systemName: "fish").iconModifier()
            }
        }
        .padding(40)
        
        
        /* Yukarıdaki örnekte olduğu gibi 3 farklı aşama için 3 farklı image set ettik, 1. aşama olan image'ın başarılı yüklenmesi durumunda image gösteirliyor, 2. aşama olan error oluşması durumunda yıldız gözteriliyor, 3. aşama olan nil durumunda ise balık gösteriliyor.   */
 */
        
        //MARK: - ANIMATION
        
        AsyncImage(url: URL(string: imageURL), transaction: Transaction(animation: .interpolatingSpring(stiffness: 0.6, damping: 0.6))) {
            phase in
            switch phase {
            case .success(let image):
                
                image.imageModifier()
                    .transition(.push(from: .trailing))
            case .failure(_):
                Image(systemName: "ant.circle.fill").iconModifier()
            case .empty:
                Image(systemName: "Star").iconModifier()
            @unknown default:
                ProgressView()
            }
        }
        .padding(40)
        
        /*
         Bu aşamada bir görselin yüklenişi başarılı olarak sonuçlanırsa belirttiğimiz yönde görselin akışına yönelik bir animasyon ekliyoruz. Bu animasyonlar;
         .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25) gibi bir sıçrama
         .easeIn(duration: 0.8) gibi bir slow geliş
         .interactiveSpring(response: 1.2, dampingFraction: 0.6, blendDuration: 0.6) gibi bir interactif sallanma
         .interpolatingSpring(stiffness: 1.4, damping: 0.6) gibi daha salınımlı bir animasyon olabilir.
         
         animasyonun hangi görsele uygulanacağını ise .transition ile belirtiyoruz, transition içerisinde;
         .move kullanarak bir kenardan getirebilir,
         .opacity kullanarak fade in efekti verebilir,
         .scale ile büyüterek getirebilir,
         .slide ile kaydırabilir,
         .push ile ios 16 ve daha yeni sürümler için hem fade in hem slide efekti vereibliriz.
         
         
         */
    }
}

@available(iOS 16.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
