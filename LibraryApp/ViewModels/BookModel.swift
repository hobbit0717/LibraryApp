//
//  BookModel.swift
//  LibraryApp
//
//  Created by JH on 2021-08-07.
//

import Foundation

class BookModel : ObservableObject {
    
    @Published var books = [Book]()
    
    init() {
        self.books = getLocalJson()
    }

    /// Retrieve all record data form a local JSON file with name `fileName` and extension `fileExtension`..
    func getLocalJson(_ fileName: String = "Data", fileExtension: String = "json") -> [Book] {
        
        var books = [Book]()
        
        // Get link to data file
        let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension)
        
        guard url != nil else {
            print("Could not retrieve category data: \(fileName).\(fileExtension) not found.")
            return books
        }
            
        do {
            // Decode the data and return it
            let data = try Data(contentsOf: url!)
            books = try JSONDecoder().decode([Book].self, from: data)
            return books
            
        } catch {
            print("Error retrieving category data: \(error.localizedDescription)")
        }
        
        return books
    }
    
    
    
    
}
