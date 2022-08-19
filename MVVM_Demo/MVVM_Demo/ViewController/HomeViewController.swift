//
//  HomeViewController.swift
//  MVVM_Demo
//
//  Created by Appzgate Solutions on 8/19/22.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickDelegatePattern(_ sender: UIButton){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vcID:String = String(describing: LoadCompanyVC.self)
        let vc = sb.instantiateViewController(withIdentifier: vcID) as! LoadCompanyVC
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func onClickClosurePattern(_ sender: UIButton){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vcID:String = String(describing: FIFAWorldCupChampionsVC.self)
        let vc = sb.instantiateViewController(withIdentifier: vcID) as! FIFAWorldCupChampionsVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
