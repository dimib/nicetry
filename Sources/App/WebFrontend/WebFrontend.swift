//
//  File.swift
//  
//
//  Created by Dimitri Brukakis on 25.04.20.
//

import Foundation
import Vapor

class WebFrontend: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        routes.get { req  in
            return Post.query(on: req.db).all().flatMap { posts -> EventLoopFuture<View> in 
                return req.view.render("index", ["posts": posts])
            }
        }
        
        routes.get("index") { req -> EventLoopFuture<View> in
            return Post.query(on: req.db).all().flatMap { posts -> EventLoopFuture<View> in
                return req.view.render("index", ["posts": posts])
            }
        }
        routes.get("about") { req in
            req.view.render("about")
        }
        
        routes.get("post", ":id") { req -> EventLoopFuture<View> in
            let id: Int? = req.parameters.get("id", as: Int.self)
            print("post \(id) \(req.route?.path) \(req.parameters.getCatchall())")
            
            return req.view.render("post")
        }
        routes.get("contact") { req  in
            req.view.render("contact")
        }

    }
}
