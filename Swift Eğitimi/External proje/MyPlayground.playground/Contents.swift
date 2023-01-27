var x: Int?

if x != nil{
    check(x: x!)
}

//MARK: - Syntaxta düzgün olacak şekilde yapmanın yolu yalnız sadece kendi if let döngüsünden optional olmadan çalışır.

if let newX = x{ //newx artık optional değil!!
    check(x: Int)
}

//MARK: - düzgün ve başka yerlerde optional değeri açabilmek için yani optional olan değeri globale optionaldan çıkartmak için bunu kullan:
 
guard let newX = x else { //çok önemli olan x değerini en başta tanımlayarak devam ediyoruz eğer x n
    return
}
//MARK: Örnek kod

if let rank = movie.vote_average{ //movie.vote_avarage 'dan gelen optional double değerini rank adında yeni bir değişkene tanımladık.
    rankLabel.text = String(describing: rank) // rankLabel.text olarak ekrana yazdırdık. artık optional değil.
}else { //optional gelirse
    return rankLabel.text = "Not ranked yet!" // henüz puanlanmamış diye yazı döndürdük
}
    

