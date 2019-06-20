//
//  VerseView.swift
//  Bible_Navigator_SwiftUI
//
//  Created by Bat-Erdene, Ene on 6/20/19.
//  Copyright © 2019 Bat-Erdene, Ene. All rights reserved.
//

import SwiftUI

struct VerseView : View {
    var chapter: Chapter
    var body: some View {
        NavigationView{
            List{
                ForEach(chapter.verses.identified(by: \.verseNum)){ diffVerses in
                    NavigationButton(destination: Text("You have reached ")){
                        Text("\(diffVerses.verseNum)")
                    }
                
                }.navigationBarTitle(Text("Verses"))
            
            }
        //Text( )
        }
    }

}
/*
 
#if DEBUG
struct VerseView_Previews : PreviewProvider {
    static var previews: some View {
        VerseView()
    }
}
#endif
*/
