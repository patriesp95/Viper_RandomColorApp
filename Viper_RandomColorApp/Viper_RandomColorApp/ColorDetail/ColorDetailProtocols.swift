//
//  ColorDetailProtocols.swift
//  Viper_RandomColorApp
//
//  Created by Patricia Martínez Espert on 20/4/24.
//

import Foundation
import UIKit

protocol ColorDetailViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: ColorDetailPresenterProtocol? { get set }
    var myColor: UIColor? { get set }
}

protocol ColorDetailPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: ColorDetailViewProtocol? { get set }
    var interactor: ColorDetailInteractorInputProtocol? { get set }
    var router: ColorDetailRouterProtocol? { get set }
    
    func viewDidLoad()
}

protocol ColorDetailInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: ColorDetailInteractorOutputProtocol? { get set }
    var localDatamanager: ColorDetailLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: ColorDetailRemoteDataManagerInputProtocol? { get set }
    
}

protocol ColorDetailInteractorOutputProtocol: AnyObject {
    // INTERACTOR -> PRESENTER
    
}

protocol ColorDetailRouterProtocol: AnyObject {
    // PRESENTER -> ROUTER
    static func createColorDetailModule(with color: UIColor) -> UIViewController
}

protocol ColorDetailDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol ColorDetailRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: ColorDetailRemoteDataManagerOutputProtocol? { get set }

}

protocol ColorDetailRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    
}

protocol ColorDetailLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
