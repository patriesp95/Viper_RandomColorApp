//
//  ColorListRouter.swift
//  Viper_RandomColorApp
//
//  Created by Patricia Martínez Espert on 19/4/24.
//

import Foundation
import UIKit

class ColorListRouter: ColorListRouterProtocol {

    static func createColorListModule() -> UIViewController {
        
        let navController = UINavigationController(rootViewController: ColorListView())
        if let view =  navController.children.first as? ColorListView {
            let presenter: ColorListPresenterProtocol & ColorListInteractorOutputProtocol = ColorListPresenter()
            let interactor: ColorListInteractorInputProtocol & ColorListRemoteDataManagerOutputProtocol = ColorListInteractor()
            let localDataManager: ColorListLocalDataManagerInputProtocol = ColorListLocalDataManager()
            let remoteDataManager: ColorListRemoteDataManagerInputProtocol = ColorListRemoteDataManager()
            let router: ColorListRouterProtocol = ColorListRouter()
            
            view.presenter = presenter
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        return UIViewController()        
    }
    
    func presentView(from view: any ColorListViewProtocol, color: UIColor) {
        let colorView = ColorDetailRouter.createColorDetailModule(with: color)
        
        if let view = view as? UIViewController {
            view.navigationController?.pushViewController(colorView, animated: true)
        }
    }
}
