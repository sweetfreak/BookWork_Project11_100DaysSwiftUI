//
//  Book.swift
//  Bookworm_Project11
//
//  Created by Jesse Sheehan on 9/6/24.
//

import Foundation
import SwiftData

@Model
class Book {
    var title: String
    var author: String
    var genre: String
    var review: String
    var rating: Int
    var date: Date
    
    
    var validBook: Bool {
        let trimmedTitle = title.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedAuthor = author.trimmingCharacters(in: .whitespacesAndNewlines)

        if trimmedTitle.isEmpty || trimmedAuthor.isEmpty {
            return false
        }
        return true

    }
    
    init(title: String, author: String, genre: String, review: String, rating: Int, date: Date) {
        self.title = title
        self.author = author
        self.genre = genre
        self.review = review
        self.rating = rating
        self.date = date
    }
}
