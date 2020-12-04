
import Foundation

struct PlayerBaseResponse: Decodable {
 // Structs are "make on copy" you are never mutating the object in memory.. you get a new copy.. there are speical things we can do to mutate structs (vs. classes) -- bottom line: vars in structs get tricky
    let players: [Player]
    
    struct Player: Decodable {
        
        let id: Int?
        let first_name: String?
        let heght_feet: Int?
        let height_inches: Int?
        let last_name: String?
        let position: String?
        let team: Team?
        let weight_pounds: Int?
        
        struct Team: Decodable {
            
            let id: Int?
            let abbreviation: String?
            let city: String?
            let conference: String?
            let division: String?
            let full_name: String?
            let name: String?
        }
    }
}

// Extensions allow us to not pollute the namespace above with CodingKeys
// Only limitation of Extension is you can't have properties (fields) -- literally EXTENDING the functionality

extension PlayerBaseResponse {
    
    enum CodingKeys: String, CodingKey {
        
        case players = "data"
    }
}

extension PlayerBaseResponse.Player {
    //TODO: Add CodingKeys to let us use camelCase
    
}

extension PlayerBaseResponse.Player.Team {
    //TODO: Add CodingKeys to let us use camelCase
}
