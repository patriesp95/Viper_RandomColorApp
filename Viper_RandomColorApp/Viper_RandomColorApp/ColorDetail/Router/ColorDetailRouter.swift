//
//  ColorDetailRouter.swift
//  Viper_RandomColorApp
//
//  Created by Patricia Martínez Espert on 20/4/24.
//

import Foundation
import UIKit

class ColorDetailRouter: ColorDetailRouterProtocol {
    
    static func createColorDetailModule(with color: UIColor) -> UIViewController {
        
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "ColorDetailView")
        if let view = viewController as? ColorDetailView {
            let presenter: ColorDetailPresenterProtocol & ColorDetailInteractorOutputProtocol = ColorDetailPresenter()
            let interactor: ColorDetailInteractorInputProtocol & ColorDetailRemoteDataManagerOutputProtocol = ColorDetailInteractor()
            let localDataManager: ColorDetailLocalDataManagerInputProtocol = ColorDetailLocalDataManager()
            let remoteDataManager: ColorDetailRemoteDataManagerInputProtocol = ColorDetailRemoteDataManager()
            let router: ColorDetailRouterProtocol = ColorDetailRouter()
            
            view.presenter = presenter
            view.myColor = color
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return viewController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "ColorDetailView", bundle: Bundle.main)
    }
}
