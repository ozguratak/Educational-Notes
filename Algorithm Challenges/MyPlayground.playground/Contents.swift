import Foundation

let stringKey = "selamın aleyküm "
let syllableIndex = 2

func chunkString(_ string: String, chunkSize: Int){
    var chunkedString = [String]()
    let length = string.count
    let chunks = length / chunkSize
    for i in 0..<chunks {
        let startIndex = string.index(string.startIndex, offsetBy: i * chunkSize)
        let endIndex = string.index(startIndex, offsetBy: chunkSize, limitedBy: string.endIndex) ?? string.endIndex
        let chunk = String(string[startIndex..<endIndex])
        chunkedString.append(chunk)
    }
    if length % chunkSize != 0 {
        let remainderStartIndex = string.index(string.startIndex, offsetBy: chunks * chunkSize)
        let remainder = String(string[remainderStartIndex..<string.endIndex])
        chunkedString.append(remainder)
    }
   
    print(chunkedString)
}

chunkString(stringKey, chunkSize: syllableIndex)

// stringi harflerine ayır,
// string içinden sırayla harf seç,
// stringden gelen harfi split edilmiş harf'e ile karşılaştır
// harfler aynı değilse yeni string olarak yaz
// oluşan hecenin arrayde olup olmadığına bak arrayde yoksa ekle
