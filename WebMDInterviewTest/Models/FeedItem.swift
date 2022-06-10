import Foundation

/**
 Create a model that will represent the feed item from the data.json file.
 */

//A model that represent the feed item structure of the feed item from the data.json file
struct FeedItem: Decodable {
    let title: String
    let description: String
    let image_url: String
    let detail: String
    
    public init(title: String, description: String, image_url: String, detail: String){
        self.title = title
        self.description = description
        self.image_url = image_url
        self.detail = detail
    }
}
