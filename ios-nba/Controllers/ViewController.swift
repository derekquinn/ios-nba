
import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var playerTable: UITableView! // These UI elements are always force unwrapped by Apple (accepted)
    
    var playersTableData: PlayerBaseResponse!
    var playerFirstLastNames: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNameTable()
        NBAPlayerService.getPlayers(parameters: "", completion:{ playerBaseResponse in
            
            self.playersTableData = playerBaseResponse
            
            // Exposing downsides of old school MVC below (threading, if /let)
            DispatchQueue.main.async { [self] in
                
                for player in self.playersTableData.players {
                    
                    if let firstName = player.firstName, let lastName = player.lastName {
                        self.playerFirstLastNames.append("\(firstName) \(lastName)")
                    }
                }
                self.playerTable.reloadData()
            }
        })
    }
    
    // Configure Table View containing names of all characters
    private func configureNameTable() {
        playerTable.delegate = self
        playerTable.dataSource = self
    }
    
    // Determines how many rows are in the Table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playerFirstLastNames.count
    }
    
    // Put characters name in each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = playerTable.dequeueReusableCell(withIdentifier: UIConstants.playerTableCellId, for: indexPath)
        cell.textLabel?.text = playerFirstLastNames[indexPath.row]
        return cell
    }
    
    // Determine which row is selected (tapped)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
}

