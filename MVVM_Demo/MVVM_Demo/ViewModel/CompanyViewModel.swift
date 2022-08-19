//
//  CompanyViewModel.swift
//  MVVM_Demo
//
//  Created by Appzgate Solutions on 8/12/22.
//

import Foundation

protocol CompanyViewModelDelegate{
    func didLoadCompanyData()
}

class CompanyViewModel{
    var companies : [Company] = []
    var companyDelegate : CompanyViewModelDelegate
    
    init(companyDelegate : CompanyViewModelDelegate){
        self.companyDelegate = companyDelegate
    }
    
    func loadCompanyData(){
        if let path = Bundle.main.path(forResource: "Company", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                self.companies = try JSONDecoder().decode([Company].self, from: data)
                self.companyDelegate.didLoadCompanyData()
            }catch{
                self.companies = []
                self.companyDelegate.didLoadCompanyData()
            }
        }
    }
}
