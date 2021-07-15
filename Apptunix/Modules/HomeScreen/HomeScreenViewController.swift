//
//  HomeScreenViewController.swift
//  Apptunix
//
//  Created by Sarthak Taneja on 14/07/21.
//

import UIKit

class HomeScreenViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = HomeScreenViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        registerTableViewCells()
        fetchData()
    }
    
    func registerTableViewCells() {
        tableView.register(UINib.init(nibName: "CategoriesTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoriesTableViewCell")
    }
}

// MARK: - UITableView Delegate and Datasource
extension HomeScreenViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesTableViewCell", for: indexPath) as! CategoriesTableViewCell
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - CategoriesTableViewCell Delegate
extension HomeScreenViewController: CategoriesTableViewCellDelegate {
    func expandTableViewCell(shouldExpand: Bool) {
        tableView.reloadData()
    }
}

// MARK: - API Call
extension HomeScreenViewController {
    func fetchData() {
        viewModel.fetchHomeData(with: HomeScreenDataController(), successResponse: { success in
            if success {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }, failure: { error in
            
        })
    }
}
