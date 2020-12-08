
import Foundation

struct PlayerBaseResponse: Decodable {
    // Structs are "make on copy" you are never mutating the object in memory.. you get a new copy.. there are speical things we can do to mutate structs (vs. classes) -- bottom line: vars in structs get tricky
    let players: [Player]
    
    struct Player: Decodable {
        
        let id: Int?
        let firstName: String?
        let heightFeet: Int?
        let heightInches: Int?
        let lastName: String?
        let position: String?
        let team: Team?
        let weightPounds: Int?
        
        struct Team: Decodable {
            
            let id: Int?
            let abbreviation: String?
            let city: String?
            let conference: String?
            let division: String?
            let fullName: String?
            let name: String?
        }
// Extensions will not work without a proper init()
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.id = try container.decodeIfPresent(Int.self, forKey: .id)
            self.firstName = try container.decodeIfPresent(String.self, forKey: .firstName)
            self.heightFeet = try container.decodeIfPresent(Int.self, forKey: .heightFeet)
            self.heightInches = try container.decodeIfPresent(Int.self, forKey: .heightInches)
            self.lastName = try container.decodeIfPresent(String.self, forKey: .lastName)
            self.position = try container.decodeIfPresent(String.self, forKey: .position)
            self.team = try container.decodeIfPresent(Team.self, forKey: .team)
            self.weightPounds = try container.decodeIfPresent(Int.self, forKey: .weightPounds)
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
    enum CodingKeys: String, CodingKey {
        
        case id
        case firstName = "first_name"
        case heightFeet = "height_feet"
        case heightInches = "height_inches"
        case lastName = "last_name"
        case position
        case team
        case weightPounds = "weight_pounds"
    }
    
}

extension PlayerBaseResponse.Player.Team {
    enum CodingKeys: String, CodingKey {
        
        case id
        case abbreviation
        case city
        case conference
        case division
        case fullName = "full_name"
        case name
    }
}
