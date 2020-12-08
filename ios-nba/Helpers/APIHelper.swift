
import Foundation

class APIHelper {
    
    static var allPlayers: [PlayerBaseResponse.Player] = []
    
    static func convertPlayerResponsesToArray(completion: @escaping ([PlayerBaseResponse.Player]) -> Void) {
        
        var playerData: PlayerBaseResponse!
        
        for i in 1...33 {
            
            let pageNumberParameter = self.createPageParameter(pageNumber: i)
            
            NBAPlayerService.getPlayers(parameters: pageNumberParameter, completion:{ playerBaseResponse in
                
                playerData = playerBaseResponse
                self.allPlayers.append(contentsOf: playerData.players)
                
                DispatchQueue.main.async{
                    
                    completion(allPlayers)
                    
                }
            })
        }
    }
    
    static func createPageParameter(pageNumber: Int) -> String {
        
        let parameter: String = "?page=\(pageNumber)&per_page=100"
        
        return parameter
    }
}
