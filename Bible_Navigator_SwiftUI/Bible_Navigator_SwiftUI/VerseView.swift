//
//  VerseView.swift
//  Bible_Navigator_SwiftUI
//
//  Created by Bat-Erdene, Ene on 6/20/19.
//  Copyright © 2019 Bat-Erdene, Ene. All rights reserved.
//
import Combine
import SwiftUI

struct VerseView : View {
    var bookName: String
    var bookID: Int
    var chapterNumber: Int
    var chapter: Chapter
    var body: some View {
        NavigationView{
            
            List{
                ForEach(chapter.verses.identified(by: \.verseNum)){ diffVerses in
                    Button(action:{ self.openURL(urlString: "olivetree://bible/\(self.bookID).\(self.chapterNumber).\(diffVerses.verseNum)")}){
                        HStack{
                            Text(self.bookName)
                            Text("\( self.chapterNumber)")
                            Text(": \(diffVerses.verseNum)")
                        }
                    }
                
                }.navigationBarTitle(Text("Verses"))
            
            }
        }
    }
    func openURL(urlString : String){
        print(urlString)
        if let url = URL(string: urlString){
            UIApplication.shared.open(url)
        }
    }

}
/*struct OpenURL: View {
    var urlString: String
    var body : UIApplication{
        if let url = URL(string: self.urlString){
            UIApplication.shared.open(url);
    }
        
    }
    
}*/
/*
 
#if DEBUG
struct VerseView_Previews : PreviewProvider {
    static var previews: some View {
        VerseView()
    }
}
#endif
*/
