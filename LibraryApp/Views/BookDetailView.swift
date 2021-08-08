//
//  BookDetailView.swift
//  LibraryApp
//
//  Created by JH on 2021-08-07.
//

import SwiftUI

struct BookDetailView: View {
    
    @EnvironmentObject var model: BookModel
    @State private var rating = 2
    
    var book: Book
    
    var body: some View {
        VStack(spacing: 20) {
            NavigationLink(destination: BookContentView(book: book)) {
                VStack {
                    Text("Read Now!")
                        .font(.title)
                        .accentColor(.black)
                    
                    Image("cover\(book.id)")
                        .resizable()
                        .scaledToFit()
                }
            }
            .padding()
            
            Text("Mark for later!")
                .font(.headline)
            
            Button(action: { model.updateFavourite(forId: book.id) }) {
                Image(systemName: book.isFavourite ? "star.fill" : "star")
                    .resizable()
                    .frame(width: 28, height: 28)
                    .foregroundColor(.yellow)
            }
            
            Text("Rate \(book.title)")
                .font(.headline)
            
            Picker("Rate this book!", selection: $rating) {
                ForEach(1..<6) { index in
                    Text("\(index)")
                        .tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding([.leading, .trailing, .bottom], 60)
            .onChange(of: rating, perform: { value in
                model.updateRating(forId: book.id, rating: rating)
            })
        }
        .onAppear { rating = book.rating }
        .navigationBarTitle("\(book.title)")
    }
}

struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailView(book:Book())
            .environmentObject(BookModel())
    }
}
