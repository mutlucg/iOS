//
//  AirportDetailViewController.swift
//  hw6
//
//  Created by Mutlu Can Gurbuz on 30/03/17.
//  Copyright © 2017 Mutlu Can Gurbuz. All rights reserved.
//

import UIKit

class AirportDetailViewController: UIViewController, AirportDataDelegate {
    
    var selectedAirport : Airport?
    let airportDataSource = AirportDataSource()
    
    @IBOutlet weak var airportPhoneNumberLabel: UILabel!
    @IBOutlet weak var airportNameLabel: UILabel!
    @IBOutlet weak var airportCode: UILabel!
    @IBOutlet weak var airportLongtitude: UILabel!
    @IBOutlet weak var airportLatitude: UILabel!
    @IBOutlet weak var airportHostCityLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "\(selectedAirport!.airportName)"
        airportDataSource.delegate = self
    }
    override func viewDidAppear(_ animated: Bool) {
        airportDataSource.loadAirportDetail(airportId: selectedAirport!.airportID)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func airportDetailLoaded(airport: Airport) {
        DispatchQueue.main.async {
            self.airportNameLabel.text = "\(airport.airportName)"
            self.airportHostCityLabel.text = "\(airport.airportHostCity)"
           
            self.airportCode.text = "\(airport.airportCode)"
            self.airportLatitude.text = "\(airport.airportLatitude)"
            self.airportLongtitude.text = "\(airport.airportLongtitude)"
            self.airportPhoneNumberLabel.text = airport.airportPhoneNumber
            
        }
    }

    

}
