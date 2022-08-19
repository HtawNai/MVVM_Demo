//
//  WorldCupChampionsVC.swift
//  MVVM_Demo
//
//  Created by Appzgate Solutions on 8/19/22.
//

import UIKit

class FIFAWorldCupChampionsVC: UITableViewController {
    
    var worldCupViewModel : FIFAWorldCupChampionViewModel!
    @IBOutlet weak var errorLabel : UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.errorLabel.isHidden = true
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.showInstructionInfoAlert()
    }
    
    private func setup(){
        self.title = "Champion list"
        
        self.worldCupViewModel = FIFAWorldCupChampionViewModel()
        self.worldCupViewModel.didLoadFIFAData = { isSuccess in
            self.refreshControl?.endRefreshing()
            self.tableView.reloadData()
            self.errorLabel.isHidden = isSuccess
        }
    }
    
    private func showErrorAlert(){
        let alertVC = UIAlertController(title: "Error", message: "Fail to read data", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertVC.addAction(action)
        self.present(alertVC, animated: true)
    }
    
    func showInstructionInfoAlert(){
        let alert = UIAlertController(title: "", message: "Please pull the screen to load the data", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        self.present(alert, animated: true)
    }

    @IBAction func refreshData(_ sender: UIRefreshControl){
        self.refreshControl?.beginRefreshing()
        self.worldCupViewModel.loadFIFAData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return worldCupViewModel.fifaChampions.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FIFAWorldCupChampionTBCell", for: indexPath) as! FIFAWorldCupChampionTBCell

        cell.config(champion: worldCupViewModel.fifaChampions[indexPath.row])

        return cell
    }
}
