//
//  ChapterView.swift
//  Bible_Navigator_SwiftUI
//
//  Created by Bat-Erdene, Ene on 6/13/19.
//  Copyright © 2019 Bat-Erdene, Ene. All rights reserved.
//
import Combine
import SwiftUI

struct ChapterView : View {
    var bookName: String
    var bookID: Int
    var book: Books
    var body: some View {
       // NavigationView{
            List{
                ForEach(book.chapters.identified(by: \.chapNumber)){ diffChapter in
                    NavigationButton(destination: VerseView( bookName: self.bookName, bookID: self.bookID, chapterNumber: diffChapter.chapNumber, chapter: diffChapter)){
                        HStack{
                            Text(self.bookName)
                            Text(" \(diffChapter.chapNumber)")
                        }
                    }
                }
            }.navigationBarTitle(Text("Chapters"))
     //   }
        //.presentation(Modal?)
       // .frame(width: scaledToFit(), height: scaledToFit(), alignment: nil)
    }
}

/*
 
#if DEBUG
struct ChapterView_Previews : PreviewProvider {
    static var previews: some View {
        ChapterView()
    }
}
#endif
*/
