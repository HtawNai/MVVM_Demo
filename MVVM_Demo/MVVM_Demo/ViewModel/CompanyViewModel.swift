//
//  CompanyViewModel.swift
//  MVVM_Demo
//
//  Created by Appzgate Solutions on 8/12/22.
//

import Foundation

protocol CompanyViewModelDelegate{
    func didLoadCompanyData(companies: [Company])
}

struct CompanyViewModel{
    
    var companyDelegate : CompanyViewModelDelegate
    
    init(companyDelegate : CompanyViewModelDelegate){
        self.companyDelegate = companyDelegate
    }
    
    func loadCompanyData(){
        if let path = Bundle.main.path(forResource: "Company", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let companies = try JSONDecoder().decode([Company].self, from: data)
                self.companyDelegate.didLoadCompanyData(companies: companies)
            }catch{
                self.companyDelegate.didLoadCompanyData(companies: [])
            }
        }
    }
}
