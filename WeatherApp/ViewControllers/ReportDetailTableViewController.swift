//
//  ReportDetailTableViewController.swift
//  WeatherApp
//
//  Created by Ali Gungor on 1.09.2018.
//  Copyright © 2018 Ali Gungor. All rights reserved.
//

import UIKit

class ReportDetailTableViewController: UITableViewController {

    @IBOutlet weak var weatherMainLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherIconLabel: UIImageView!
    @IBOutlet weak var timePeriodLabel: UILabel!
    
    var report: Report!
    
    private var sectionTitles = ["Temperature", "Wind"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherMainLabel.text = report.weather.first?.main ?? ""
        weatherIconLabel.loadURL(url: (report.weather.first?.iconURL)!)
        temperatureLabel.text = String.init(format: "%0.2fº", report.main.temp)
        timePeriodLabel.text = report.startTime + " - " + report.endTime
        title = report.dateString
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? report.main.properties.count : report.wind.properties.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let properties = indexPath.section == 0 ? report.main.properties : report.wind.properties
        let property = properties[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = property.name
        cell.detailTextLabel?.text = property.value
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }

}
