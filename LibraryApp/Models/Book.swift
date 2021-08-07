//
//  Book.swift
//  LibraryApp
//
//  Created by JH on 2021-08-07.
//

import Foundation

struct Book : Decodable, Identifiable {
    
    var title = "Title"
    var author = "Author"
    var isFavourite = false
    var currentPage = 0
    var rating = 2
    var id = 1
    var content = ["I am a test book."]
}
