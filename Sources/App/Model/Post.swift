//
//  File.swift
//  
//
//  Created by Dimitri Brukakis on 26.04.20.
//

import Foundation
import Vapor
import Fluent

final class Post: Model, Content {
    
    typealias IDValue = UUID
    
    static var schema: String = "post"
    
    @ID var id: IDValue?
    @Field(key: "date") var date: String
    @Field(key: "headline") var headline: String
    @Field(key: "summary") var summary: String
    @Field(key: "text") var text: String
    @Field(key: "images") var images: [String]
    
    init() {
        // 
    }
    

    init(id: UUID = UUID(), date: String = "\(Date())", headline: String, summary: String, text: String, images: [String] = []) {
        self.id = id
        self.date = date
        self.headline = headline
        self.summary = summary
        self.text = text
        self.images = images
    }
}

extension Post {
    static func decode(string: String?) -> Post? {
        guard let string = string, let data = string.data(using: .utf8) else { return nil }
        let decoder = JSONDecoder()
        return try? decoder.decode(Post.self, from: data)
    }
}
