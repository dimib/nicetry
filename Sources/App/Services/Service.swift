//
//  File.swift
//  
//
//  Created by Dimitri Brukakis on 25.04.20.
//

import Foundation
import Vapor

enum PostError: Error {
    case emptyBody
    case decodeFailure
}

class Services: RouteCollection {
    
    let basicPath: String
    
    init(basicPath: String = "service") {
        self.basicPath = basicPath
    }
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.get("service", "posts") { req -> EventLoopFuture<[Post]> in
            Post.query(on: req.db).all()
        }
        
        routes.post("service", "posts") { req -> EventLoopFuture<Post> in
            if let post = Post.decode(string: req.body.string) {
                return post.create(on: req.db).map { post }
            }
            return req.eventLoop.makeFailedFuture(PostError.decodeFailure)
        }
    }
}
