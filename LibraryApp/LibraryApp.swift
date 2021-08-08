//
//  LibraryApp.swift
//  LibraryApp
//
//  Created by JH on 2021-08-07.
//

import SwiftUI

@main
struct LibraryApp: App {
    var body: some Scene {
        WindowGroup {
            BookListView()
                .environmentObject(BookModel())
        }
    }
}
