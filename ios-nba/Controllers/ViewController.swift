
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var playerTable: UITableView! // These UI elements are always force unwrapped by Apple (accepted)
    var playersTableData: PlayerBaseResponse!
    var playerFirstLastNames: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NBAPlayerService.getPlayers(parameters: "", completion:{ playerBaseResponse in
            
            //print(playerBaseResponse.players[0].first_name)
            
            self.playersTableData = playerBaseResponse
            
            // Exposing downsides of old school MVC below (threading, if /let)
            DispatchQueue.main.async { [self] in
                
                for player in self.playersTableData.players {
                    
                    if let firstName = player.first_name, let lastName = player.last_name {
                        self.playerFirstLastNames.append("\(firstName) \(lastName)")
                    }
                    
                    print("first name=",player.first_name,"last name=", player.last_name, playerFirstLastNames.count)
                }
            }
        })
    }
}

