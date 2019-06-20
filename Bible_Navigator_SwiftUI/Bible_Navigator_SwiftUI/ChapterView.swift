//
//  ChapterView.swift
//  Bible_Navigator_SwiftUI
//
//  Created by Bat-Erdene, Ene on 6/13/19.
//  Copyright © 2019 Bat-Erdene, Ene. All rights reserved.
//

import SwiftUI

struct ChapterView : View {
    var book: Books
    var body: some View {
        NavigationView{
            List{
                ForEach(book.chapters.identified(by: \.chapNumber)){ diffChapter in
                    NavigationButton(destination: VerseView(chapter: diffChapter)){
                        Text("\(diffChapter.chapNumber)")
                    }
                }
            }.navigationBarTitle(Text("Chapters"))
        }
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
