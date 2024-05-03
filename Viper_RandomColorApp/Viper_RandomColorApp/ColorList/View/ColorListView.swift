//
//  ColorListViewController.swift
//  Viper_RandomColorApp
//
//  Created by Patricia Martínez Espert on 19/4/24.
//

import Foundation
import UIKit

class ColorListView: UIViewController {
    var presenter: ColorListPresenterProtocol?
    var colors: [UIColor]?
        
    private let myTable: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.allowsSelection = true
        return tableView
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        self.myTable.delegate = self
        self.myTable.dataSource = self
        setupUI()
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    func configurePokemonTableView(){
        view.addSubview(myTable)
        myTable.translatesAutoresizingMaskIntoConstraints = false
                
        NSLayoutConstraint.activate([
            myTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            myTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            myTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            myTable.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
        

    private func setupUI(){
        view.backgroundColor = .systemBackground
        configurePokemonTableView()
    }
}

extension ColorListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let colors = self.colors else { return 0 }
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        if let colors = self.colors {
            Cell.backgroundColor = colors[indexPath.row]
        }
        return Cell
    }
}

extension ColorListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let colors = self.colors else { return }
        presenter?.showColor(with: colors[indexPath.row])
    }
}

extension ColorListView: ColorListViewProtocol{
    func showColors(colors: [UIColor]) {
        self.colors = colors
    }
}
