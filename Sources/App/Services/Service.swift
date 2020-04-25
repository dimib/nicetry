//
//  File.swift
//  
//
//  Created by Dimitri Brukakis on 25.04.20.
//

import Foundation
import Vapor

class Services: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        routes.get { req  in
            req.view.render("index", [
                "title":"Welcome to my page",
                "content":"You will find a lot of stuff here. Just lean back and watch!"
            ])
        }
    }
}
