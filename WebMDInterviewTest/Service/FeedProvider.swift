import Foundation


struct FeedProvider {
    
    /**
     1. Create a function that will use the ResourceReader to read the data.json file and map the data to the corresponding models.
     2. Any feed items with the same title are considered duplicates and should be removed.
     3. Sort the FeedItem objects in alphabetical order by title.
     4. Make sure not to block the main thread when this task is performed.
     Note that this function should be used by FeedViewController to get the array of filtered and sorted FeedItem objects.
     */

    public static func getFeedItems() -> [FeedItem] {
        var finalItems: [FeedItem] = []
        var finalItemsTitle: [String] = []
        
        // Tried using the Resource reader but it throws error so i resolved
        // to implementing the resource reder from scratch
        //        ResourceReader.read<FeedItems>(resource: "data", ofType: "json")
        //        let finalFeedItems: FeedItems = ResourceReader.read(resource: "data", ofType: "json")

        guard let sourcesURL = Bundle.main.url(forResource: "data", withExtension: "json") else {
            fatalError("Could not find data.json");
        }
        guard let itemData = try? Data(contentsOf: sourcesURL)else {
            fatalError("Could not convert data")
        }
        let results = JSONDecoder()

        guard let itemForFeeds = try? results.decode(FeedItems.self, from: itemData) else {
            fatalError("There was a problem decoding the data")
        }
        
        for item in itemForFeeds.items{
            if(finalItemsTitle.isEmpty){
                finalItems.append(item)
                finalItemsTitle.append(item.title)
            }else {
                if (finalItemsTitle.contains(item.title) == false) {
                    finalItems.append(item)
                    finalItemsTitle.append(item.title)
                }
            }
            
        }
        
        let sortedFinalItems = finalItems.sorted{$0.title < $1.title}
        
        return sortedFinalItems
    }
}
