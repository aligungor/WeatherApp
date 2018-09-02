//
//  ReportTableViewCell.swift
//  WeatherApp
//
//  Created by Ali Gungor on 1.09.2018.
//  Copyright © 2018 Ali Gungor. All rights reserved.
//

import UIKit

class ReportTableViewCell: UITableViewCell {

    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var weekDayLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    
    var report = Report() {
        didSet {
            guard let weather = report.weather.first else {
                return
            }
            iconImageView.loadURL(url: weather.iconURL)
            weatherDescriptionLabel.text = weather.main
            dateLabel.text = report.dateString
            weekDayLabel.text = report.weekDay
            timeLabel.text = report.startTime + " - " + report.endTime
            temperatureLabel.text = String(format: "%dº", Int(report.main.temp))
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
