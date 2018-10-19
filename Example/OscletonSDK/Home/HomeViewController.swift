//
//  ViewController.swift
//  OscletonSDK
//
//  Created by Arthur Vimond on 12/10/2018.
//  Copyright © 2018 Arthur Vimond. All rights reserved.
//

import UIKit
import OscletonSDK
import RxSwift

class HomeViewController: UITableViewController {
    
    private let bag = DisposeBag()
    
    private let viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    ////////////////////////////// UITableViewDataSource //////////////////////////////
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.bind(viewModel: viewModel, indexPath: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: viewModel.segueIdentifierForRow(at: indexPath), sender: self)
    }

}

