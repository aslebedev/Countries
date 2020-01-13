//
//  ViewController.swift
//  Countries
//
//  Created by alexander on 22.11.2019.
//  Copyright © 2019 alexander. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    //  https://en.wikipedia.org/w/api.php?action=query&prop=revisions&rvsection=0&rvprop=content&format=jsonfm&titles=England

    var countries = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Countries"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        countries.append(Country(name: "Russia", capital: "Moscow", population: 144))
        countries.append(Country(name: "England", capital: "London", population: 85))
    }

    // MARK: - Table view data source
    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    */
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return countries.count
    }

    // Returns cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryName", for: indexPath)
//        DispatchQueue.main.async {
//            cell.textLabel?.text = self.countries[indexPath.row]
//        }
        cell.textLabel?.text = self.countries[indexPath.row].name
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1: try loading the "Detail" view controller and typecasting it to be DetailViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            // 2: success! Set its selectedImage property
            vc.countryInfo = countries[indexPath.row].countryInfo
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
