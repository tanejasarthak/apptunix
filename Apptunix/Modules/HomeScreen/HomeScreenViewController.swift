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
        tableView.register(UINib.init(nibName: "FeaturedItemsTableViewCell", bundle: nil), forCellReuseIdentifier: "FeaturedItemsTableViewCell")
    }
}

// MARK: - UITableView Delegate and Datasource
extension HomeScreenViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 150
        }
        return UITableView.automaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FeaturedItemsTableViewCell", for: indexPath) as! FeaturedItemsTableViewCell
            cell.configureCell(featuredVM: viewModel.topBannersVM)
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesTableViewCell", for: indexPath) as! CategoriesTableViewCell
        cell.delegate = self
        cell.configureCell(featuredVM: viewModel.featuredProductsVM)
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
                self.fetchImage()
            }
        }, failure: { error in
            
        })
    }

    func fetchImage() {
        guard let topBannersVM = viewModel.topBannersVM else { return }
        viewModel.fetchImage(with: HomeScreenDataController(), imageEndPoint: topBannersVM) { success in
            if success {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        } failure: { error in
            
        }

    }
}
