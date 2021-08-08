//
//  BookContentView.swift
//  LibraryApp
//
//  Created by JH on 2021-08-07.
//

import SwiftUI

struct BookContentView: View {
    
    @EnvironmentObject var model: BookModel
    @State private var page = 0
    var book: Book
    
    var body: some View {
        TabView(selection: $page) {
            ForEach(book.content.indices) { index in
                VStack(alignment: .center) {
                    Text(book.content[index])
                        .tag(index)
                    
                    Spacer()
                    
                    Text("\(page + 1)")
                }
            }
            .padding()
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
        .onChange(of: page, perform: { value in
            model.updatePage(forId: book.id, page: page)
        })
        .onAppear {
            //page = book.currentPage
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                page = book.currentPage
            }
        }
        
    }
}

struct BookContentView_Previews: PreviewProvider {
    static var previews: some View {
        BookContentView(book: Book())
            .environmentObject(BookModel())
    }
}
