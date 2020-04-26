import Vapor
import Leaf
import Fluent
import FluentMongoDriver

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    // Database
    
    try app.databases.use(.mongo(connectionString: "mongodb://localhost:27017/nicetry"), as: .mongo)
    
    // register routes
    try routes(app)
    
    app.leaf.configuration = LeafConfiguration(rootDirectory: app.directory.viewsDirectory)
    app.views.use(.leaf)
    
    app.http.server.configuration.port = 8013
}
