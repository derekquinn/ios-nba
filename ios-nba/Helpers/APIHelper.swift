
import Foundation

class APIHelper {
    
    static var allPlayerNames: [String] = []
    
    static func convertPlayerResponsesToArray(completion: @escaping ([String]) -> Void) {
        
        var playerData: PlayerBaseResponse!
        
        for i in 1...33 {
            
            NBAPlayerService.getPlayers(parameters: "?page=\(i)&per_page=100", completion:{ playerBaseResponse in
                
                playerData = playerBaseResponse
                DispatchQueue.main.async{
                    
                    for player in playerData.players {
                        if let firstName = player.firstName, let lastName = player.lastName {
                            allPlayerNames.append("\(firstName) \(lastName)")
                        }
                    }
                    completion(allPlayerNames)
                }
            })
        }
    }
}
