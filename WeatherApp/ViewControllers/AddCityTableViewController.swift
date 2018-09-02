//
//  AddCityTableViewController.swift
//  WeatherApp
//
//  Created by Ali Gungor on 2.09.2018.
//  Copyright © 2018 Ali Gungor. All rights reserved.
//

import UIKit

protocol AddCityDelegate {
    
    func cityQueried(addCityTableViewController: AddCityTableViewController, city: String)
    
}

class AddCityTableViewController: UITableViewController {
    
    @IBOutlet weak var textField: UITextField!
    private var queriedCities = CityCache.shared.cities
    var delegate: AddCityDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add New City"
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return queriedCities.isEmpty ? nil : "Recent Searches"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return queriedCities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = queriedCities[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let city = queriedCities[indexPath.row]
        delegate.cityQueried(addCityTableViewController: self, city: city)
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            CityCache.shared.remove(city: queriedCities[indexPath.row])
            self.queriedCities.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    private func addCityUsingTextField() {
        self.view.endEditing(true)
        guard let city = textField.text, !city.isEmpty else {
            showAlert(title: "Warning", message: "City can not be empty.", buttonTitle: "OK", buttonAction: {
                self.textField.becomeFirstResponder()
            })
            return
        }
        delegate.cityQueried(addCityTableViewController: self, city: city.trimmingCharacters(in: .whitespacesAndNewlines))
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func addAction(_ sender: UIButton) {
        addCityUsingTextField()
    }
    
}

extension AddCityTableViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addCityUsingTextField()
        return true
    }
    
}
