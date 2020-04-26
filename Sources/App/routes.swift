import Vapor
import Leaf

func routes(_ app: Application) throws {

    try app.routes.register(collection: WebFrontend())
    try app.routes.register(collection: Services())
}
