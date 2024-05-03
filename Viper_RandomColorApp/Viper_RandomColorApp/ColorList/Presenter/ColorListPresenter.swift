//
//  ColorListPresenterView.swift
//  Viper_RandomColorApp
//
//  Created by Patricia Martínez Espert on 19/4/24.
//

import Foundation
import UIKit

class ColorListPresenter: ColorListPresenterProtocol {
    weak var view: ColorListViewProtocol?
    var interactor: ColorListInteractorInputProtocol?
    var router: ColorListRouterProtocol?
    
    func viewDidLoad() {
        interactor?.getColors()
    }
    
    func showColor(with color: UIColor) {
        if let view = view {
            router?.presentView(from: view, color: color)
        }
    }
    
}

extension ColorListPresenter: ColorListInteractorOutputProtocol {
    func sendBackColors(colors: [UIColor]) {
        view?.showColors(colors: colors)
    }
}
