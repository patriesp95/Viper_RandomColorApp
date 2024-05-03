//
//  ColorDetailInteractor.swift
//  Viper_RandomColorApp
//
//  Created by Patricia Martínez Espert on 20/4/24.
//

import Foundation

class ColorDetailInteractor: ColorDetailInteractorInputProtocol {
   
    var presenter: ColorDetailInteractorOutputProtocol?
    var localDatamanager: ColorDetailLocalDataManagerInputProtocol?
    var remoteDatamanager: ColorDetailRemoteDataManagerInputProtocol?
    
}

extension ColorDetailInteractor: ColorDetailRemoteDataManagerOutputProtocol {
    
}
