//
//  ColorListRemoteDataManager.swift
//  Viper_RandomColorApp
//
//  Created by Patricia Martínez Espert on 19/4/24.
//

import Foundation
import UIKit

class ColorListRemoteDataManager: ColorListRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: ColorListRemoteDataManagerOutputProtocol?
    var colors = [UIColor]()
    
    func fetchColors() {
        createRandomColors()
        remoteRequestHandler?.sendBackColors(colors: self.colors)
    }
    
    private func createRandomColors(){
        for _ in 1...50 {
            self.colors.append(creteRandomColor())
        }
    }
    
    private func creteRandomColor() -> UIColor {
        let randomColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        return randomColor
    }
}
