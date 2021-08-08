//
//  BookListView.swift
//  LibraryApp
//
//  Created by JH on 2021-08-07.
//

import SwiftUI

struct BookListView: View {
    
    @EnvironmentObject var model: BookModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 30) {
                    ForEach(model.books) { book in
                        NavigationLink(destination: BookDetailView(book: book)) {
                            BookPreview(book: book)
                                .padding([.leading, .trailing], 20)
                        }
                        // The NavigationLink is a known workaround for an issue identified in iOS 14.5 where the navigation link pops the view as per these forum threads:
                        // https://developer.apple.com/forums/thread/677333
                        // https://forums.swift.org/t/14-5-beta3-navigationlink-unexpected-pop/45279
                        NavigationLink(destination: EmptyView()) {
                            EmptyView()
                        }
                    }
                    
                }
                .padding(.top)
            }
            .navigationTitle("My Library")
        }
    }
}

struct BookListView_Previews: PreviewProvider {
    static var previews: some View {
        BookListView()
            .environmentObject(BookModel())
    }
}
