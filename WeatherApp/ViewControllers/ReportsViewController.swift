//
//  ReportsViewController.swift
//  WeatherApp
//
//  Created by Ali Gungor on 1.09.2018.
//  Copyright © 2018 Ali Gungor. All rights reserved.
//

import UIKit

class ReportsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var refreshControl = UIRefreshControl()
    
    var reports = [Report]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var city = City() {
        didSet {
            self.title = city.name
        }
    }
    
    var searchCityName: String? {
        didSet {
            fetchData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addRefreshControl()
        self.searchCityName = CityCache.shared.cities.first
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if
            let reportDetail = segue.destination as? ReportDetailTableViewController,
            let senderView = sender as? UIView,
            let indexPath = senderView.indexPath(at: self.tableView) {
            reportDetail.report = reports[indexPath.row]
        }
        
        if let addCity = segue.destination as? AddCityTableViewController {
            addCity.delegate = self
        }
    }
    
    private func addRefreshControl() {
        self.tableView.refreshControl = refreshControl
        self.refreshControl.addTarget(self, action: #selector(fetchData), for: .valueChanged)
    }
    
    @objc private func fetchData() {
        guard let searchCity = self.searchCityName, !searchCity.isEmpty else {
            if self.refreshControl.isRefreshing {
                self.refreshControl.endRefreshing()
            }
            return
        }
        
        if !self.refreshControl.isRefreshing {
            self.showActivityIndicator(in: self.view)
            self.tableView.hide()
        }
        
        ForecastService.getForecast(for: searchCity, successful: { (reports, city) in
            self.reports = reports
            self.city = city
            CityCache.shared.add(city: city.name)
            if !self.refreshControl.isRefreshing {
                self.hideActivityIndicator(in: self.view)
                self.tableView.show(animated: true)
            } else {
                self.refreshControl.endRefreshing()
            }
        }, failure: { (error) in
            self.showAlert(title: "Error", message: error, buttonTitle: "Ok")
            if !self.refreshControl.isRefreshing {
                self.hideActivityIndicator(in: self.view)
                self.tableView.show(animated: true)
            } else {
                self.refreshControl.endRefreshing()
            }
        })
    }

}

extension ReportsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reports.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ReportTableViewCell
        let report = reports[indexPath.row]
        cell.report = report
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let searchCity = self.searchCityName, !searchCity.isEmpty else {
            let label = UILabel()
            label.text = "Add new city to view weather forecast."
            label.textAlignment = .center
            tableView.backgroundView = label
            return 0
        }
        tableView.backgroundView = nil
        return 1
    }
    
}

extension ReportsViewController: AddCityDelegate {
    
    func cityQueried(addCityTableViewController: AddCityTableViewController, city: String) {
        searchCityName = city
    }
    
}
