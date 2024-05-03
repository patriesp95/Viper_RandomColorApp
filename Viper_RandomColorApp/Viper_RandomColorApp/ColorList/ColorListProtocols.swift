//
//  ColorListProtocols.swift
//  Viper_RandomColorApp
//
//  Created by Patricia Martínez Espert on 19/4/24.
//

import Foundation
import UIKit

protocol ColorListViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: ColorListPresenterProtocol? { get set }
    var colors: [UIColor]? { get set }
    func showColors(colors: [UIColor])
}

protocol ColorListPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: ColorListViewProtocol? { get set }
    var interactor: ColorListInteractorInputProtocol? { get set }
    var router: ColorListRouterProtocol? { get set }
    
    func viewDidLoad()
    func showColor(with color: UIColor)
}

protocol ColorListInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: ColorListInteractorOutputProtocol? { get set }
    var localDatamanager: ColorListLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: ColorListRemoteDataManagerInputProtocol? { get set }
    
    func getColors()
}

protocol ColorListInteractorOutputProtocol: AnyObject {
    // INTERACTOR -> PRESENTER
    func sendBackColors(colors: [UIColor])
    
}

protocol ColorListRouterProtocol: AnyObject {
    // PRESENTER -> ROUTER
    static func createColorListModule() -> UIViewController
    func presentView(from view: ColorListViewProtocol, color: UIColor)
}

protocol ColorListDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol ColorListRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: ColorListRemoteDataManagerOutputProtocol? { get set }
    func fetchColors()

}

protocol ColorListRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    func sendBackColors(colors: [UIColor])
    
}

protocol ColorListLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
