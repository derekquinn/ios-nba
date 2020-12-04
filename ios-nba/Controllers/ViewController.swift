
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NBAPlayerService.getPlayers(parameters: "", completion:{ playerBaseResponse in
            
            print(playerBaseResponse.players[0].first_name)
            
        })
    }


}

