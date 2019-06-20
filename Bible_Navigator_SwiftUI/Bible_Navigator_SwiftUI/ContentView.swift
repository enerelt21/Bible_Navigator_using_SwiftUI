//
//  ContentView.swift
//  Bible_Navigator_SwiftUI
//
//  Created by Bat-Erdene, Ene on 6/10/19.
//  Copyright © 2019 Bat-Erdene, Ene. All rights reserved.
//

import SwiftUI
import Combine

struct Verse:Decodable{
    let verseNum: Int
}
struct Chapter: Decodable{
    let chapNumber: Int
    let verses: Array<Verse>
}
struct Books: Decodable{
    var name: String
    var bookID: Int
    var chapters: Array<Chapter>
}
class Bible: BindableObject{
    var didChange = PassthroughSubject<Bible, Never>()
    var bibleBook = Array<Books>(){
        didSet{
            didChange.send(self)
        }
    }
    init () {
        guard let url = URL(string: "https://www.dropbox.com/s/y24kzlvu1lh5f12/BibleJson.json?dl=1") else {return}
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
            guard let Data = data else{ return }
            var book : NSDictionary
            book = try! JSONSerialization.jsonObject(with: Data, options: []) as! NSDictionary
            
            for i in 0...(book.count - 1){
                var arrayResult: NSDictionary
                arrayResult = book.object(forKey: String(i+1)) as! NSDictionary
                var chapterResult: NSDictionary
                chapterResult = arrayResult.object(forKey: "chapters") as! NSDictionary
                
                var tempChapter = Array<Chapter>()
                var verseResult: String

                for j in 0...(chapterResult.count - 1){
                    verseResult = chapterResult.object(forKey: String(j+1)) as! String
                    var tempVerse = Array<Verse>()
                    let a : Int = Int(verseResult) ?? 1
                    for k in 1...a{
                        tempVerse.append(Verse(verseNum: k))
                    }
                    tempChapter.append(Chapter(chapNumber: j+1, verses: tempVerse))
                }
                DispatchQueue.main.async{self.bibleBook.append(Books(name: arrayResult.object(forKey: "name") as! String, bookID: (i+1), chapters: tempChapter))
                }
            }
        }.resume()
        
    }
}
struct ContentView : View {
    @State var bible = Bible()
 
    var body: some View {
        NavigationView{
            List{
                ForEach(bible.bibleBook.identified(by: \.name)){ diffBook in
                    NavigationButton(destination: ChapterView(bookName: diffBook.name, bookID: diffBook.bookID, book: diffBook)){
                        Text(diffBook.name)
                    }
                }
            }.navigationBarTitle(Text("Books"))
        }
    }
}
#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        //networkManager.bibleBook
        ContentView()
    }
}
#endif
