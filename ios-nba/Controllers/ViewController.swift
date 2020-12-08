
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var playerTable: UITableView! // These UI elements are always force unwrapped by Apple (accepted)
    var players: [PlayerBaseResponse.Player] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNameTable()
        
        APIHelper.convertPlayerResponsesToArray(completion: { allPlayers in
            self.players = allPlayers
            self.playerTable.reloadData()
        })
    }
    
    // Configure UITableView delegate / data
    private func configureNameTable() {
        playerTable.delegate = self
        playerTable.dataSource = self
    }
    
    // Determines how many rows are in the UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    // Put player's name in each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = playerTable.dequeueReusableCell(withIdentifier: UIConstants.playerTableCellId, for: indexPath)
        cell.textLabel?.text = "\(players[indexPath.row].firstName!) \(players[indexPath.row].lastName!)"
        return cell
    }
}
