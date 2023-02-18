//
//  FillUserDataModel.swift
//  Messendev
//
//  Created by Иван Карплюк on 03.02.2023.
//

import UIKit

protocol FillUserDataModelInput {
    func initialize() async
}

final class FillUserDataModel: FillUserDataModelInput {

    private let fillUserDataService: FillUserDataServiceable
    
    init(fillUserDataService: FillUserDataServiceable) {
        self.fillUserDataService = fillUserDataService
        
    }
       
    func initialize() async {
        do {
            let user = try await fillUserDataService.sendUserData()
            print(user)
        } catch let error{
            Log.error(error)
        }
    }
    
    
}
