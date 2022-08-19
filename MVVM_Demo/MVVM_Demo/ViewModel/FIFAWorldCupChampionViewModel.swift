//
//  WorldCupChampionsViewModel.swift
//  MVVM_Demo
//
//  Created by Appzgate Solutions on 8/19/22.
//

import Foundation

class FIFAWorldCupChampionViewModel{
    var fifaChampions : [FIFAWorldCupChampion] = []
    
    var didLoadFIFAData: ((_ isSuccess: Bool) -> Void)?
    
    init(){
    }
    
    func loadFIFAData(){
        if let path = Bundle.main.path(forResource: "FIFA", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                self.fifaChampions = try JSONDecoder().decode([FIFAWorldCupChampion].self, from: data)
                didLoadFIFAData?(true)
            }catch{
                didLoadFIFAData?(false)
            }
        }else{
            didLoadFIFAData?(false)
        }
    }
}
