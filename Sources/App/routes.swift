import Vapor
import Leaf

func routes(_ app: Application) throws {
    app.get { req  in
        req.view.render("index")
    }

    app.get("hello") { req -> String in
        return "Hello, world!"
    }
}
