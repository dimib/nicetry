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
            req.view.render("index")
        }
        
        routes.get("index") { req  in
            req.view.render("index")
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
