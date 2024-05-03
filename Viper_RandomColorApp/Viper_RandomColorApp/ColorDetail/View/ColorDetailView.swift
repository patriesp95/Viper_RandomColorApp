//
//  ColorDetailView.swift
//  Viper_RandomColorApp
//
//  Created by Patricia Martínez Espert on 20/4/24.
//

import Foundation
import UIKit

class ColorDetailView: UIViewController {
    var presenter: ColorDetailPresenterProtocol?
    var myColor: UIColor?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupUI()
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
        

    private func setupUI(){
        DispatchQueue.main.async {
            self.view.backgroundColor = self.myColor
        }
    }
}

extension ColorDetailView: ColorDetailViewProtocol {
    
}
