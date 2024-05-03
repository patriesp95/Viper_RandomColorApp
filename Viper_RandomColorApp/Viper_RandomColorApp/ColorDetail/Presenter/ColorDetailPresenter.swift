//
//  ColorDetailPresenter.swift
//  Viper_RandomColorApp
//
//  Created by Patricia Martínez Espert on 20/4/24.
//

import Foundation

class ColorDetailPresenter: ColorDetailPresenterProtocol {
    weak var view: ColorDetailViewProtocol?
    var interactor: ColorDetailInteractorInputProtocol?
    var router: ColorDetailRouterProtocol?
    
    func viewDidLoad() {
        
    }
}

extension ColorDetailPresenter: ColorDetailInteractorOutputProtocol {
   
}
