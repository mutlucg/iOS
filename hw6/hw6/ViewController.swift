//
//  ViewController.swift
//  hw6
//
//  Created by Mutlu Can Gurbuz on 30/03/17.
//  Copyright © 2017 Mutlu Can Gurbuz. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, AirportDataDelegate {

    @IBOutlet weak var airportTableView: UITableView!
    
    let airportDataSource = AirportDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = "Airport List"
        airportDataSource.delegate = self
    }
    override func viewDidAppear(_ animated: Bool) {
        
        airportDataSource.loadAirportList()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func airportListLoaded() {
        
        DispatchQueue.main.async {
            self.airportTableView.reloadData()
        }
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return airportDataSource.airportArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "airportTableViewCell", for: indexPath) as! AirportTableViewCell
        
        let airport = airportDataSource.airportArray[indexPath.row]
        
        cell.airportName.text = "\(airport.airportName)"
        cell.airportCityName.text = "\(airport.airportHostCity)"
        cell.airportCode.text = "\(airport.airportCode)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Airport List"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let selectedCell = sender as! AirportTableViewCell
        
        let indexPath = self.airportTableView.indexPath(for: selectedCell)
        
        let controller = segue.destination as! AirportDetailViewController
        
        controller.selectedAirport = airportDataSource.airportArray[indexPath!.row]
        
    }



}

