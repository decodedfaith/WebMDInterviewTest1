import Foundation

/**
 Create a model that will represent the top-level structure of the data.json file (i.e will hold the list of feed items).
 */

//A model that represent the top-level structure of the data.json file
struct FeedItems: Decodable {
    let items: [FeedItem]
    
    public init(items: [FeedItem]){
        self.items = items
    }
}