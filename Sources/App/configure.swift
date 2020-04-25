import Vapor
import Leaf

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    // register routes
    try routes(app)
    
    app.leaf.configuration = LeafConfiguration(rootDirectory: "Resources")
    app.views.use(.leaf)
    
    app.http.server.configuration.port = 8013
}
