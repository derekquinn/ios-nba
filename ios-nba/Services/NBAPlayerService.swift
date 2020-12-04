
import Foundation

class NBAPlayerService {
    
    static func getPlayers(parameters: String?, completion: @escaping (PlayerBaseResponse) -> Void){
        
        let url: URL = URL(string: APIConstants.basePlayerUrl+parameters!)!
        
        print("[Started] getPlayers url=", url.debugDescription)
        
        URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            
            guard let data = data, error == nil else {
                print("[Error] getPlayers() error =", error)
                return
            }
            
            do {
                let playerBaseResponse: PlayerBaseResponse = try JSONDecoder().decode(PlayerBaseResponse.self, from: data)
                completion(playerBaseResponse)
                print("[Success] getPlayers() playerBaseResponse count=", playerBaseResponse.players.count)
            } catch {
                print("[Error] JSONDecoder() error =", error)
                
            }
        }).resume()
    }
}
