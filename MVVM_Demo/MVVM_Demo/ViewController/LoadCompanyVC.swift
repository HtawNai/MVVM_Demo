//
//  ViewController.swift
//  MVVM_Demo
//
//  Created by Appzgate Solutions on 8/12/22.
//

import UIKit

class LoadCompanyVC: UIViewController {
    
    @IBOutlet weak var companyTableView : UITableView!
    var companyViewModel : CompanyViewModel!

    lazy var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.showInstructionInfoAlert()
    }
    
    func showInstructionInfoAlert(){
        let alert = UIAlertController(title: "", message: "Please pull the screen to load the data", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    func setup(){
        self.title = "Company list"
        self.companyViewModel = CompanyViewModel(companyDelegate: self)
        
        self.companyTableView.delegate = self
        self.companyTableView.dataSource = self
        
        self.refreshControl.addTarget(self, action: #selector(self.refreshData), for: .valueChanged)
        self.companyTableView.refreshControl = refreshControl
    }
    
    @objc
    func refreshData(){
        companyViewModel.loadCompanyData()
    }
    
}

extension LoadCompanyVC : CompanyViewModelDelegate{
    func didLoadCompanyData() {
        self.refreshControl.endRefreshing()
        self.companyTableView.reloadData()
    }
}

extension LoadCompanyVC : UITableViewDelegate, UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.companyViewModel.companies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CompanyTBCell") as! CompanyTBCell
        cell.config(self.companyViewModel.companies[indexPath.row])
        return cell
    }
}
