//
//  ColorListInteractorView.swift
//  Viper_RandomColorApp
//
//  Created by Patricia Martínez Espert on 19/4/24.
//

import Foundation
import UIKit

class ColorListInteractor: ColorListInteractorInputProtocol {
   
    var presenter: ColorListInteractorOutputProtocol?
    var localDatamanager: ColorListLocalDataManagerInputProtocol?
    var remoteDatamanager: ColorListRemoteDataManagerInputProtocol?
    
    func getColors() {
        remoteDatamanager?.fetchColors()
    }
}

extension ColorListInteractor: ColorListRemoteDataManagerOutputProtocol {
    func sendBackColors(colors: [UIColor]) {
        //print("we are colors... \(colors)")
        presenter?.sendBackColors(colors: colors)
    }
}
