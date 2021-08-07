//
//  BookPreview.swift
//  LibraryApp
//
//  Created by JH on 2021-08-07.
//

import SwiftUI

struct BookPreview: View {
    
    var book: Book

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .shadow(color: .gray, radius: 5, x: -5, y: 5)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(book.title)
                        .font(.title)
                        .bold()
                    
                    Spacer()
                    
                    if book.isFavourite {
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 28, height: 28)
                            .foregroundColor(.yellow)
                    }
                }
                Text(book.author)
                    .italic()
                
                Image("cover\(book.id)")
                    .resizable()
                    .scaledToFit()
            }
            .padding()
        }
    }
}

struct BookPreview_Previews: PreviewProvider {
    static var previews: some View {
        BookPreview(book: Book())
    }
}
