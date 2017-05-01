//
//  Airport.swift
//  hw6
//
//  Created by Mutlu Can Gurbuz on 30/03/17.
//  Copyright © 2017 Mutlu Can Gurbuz. All rights reserved.
//

import Foundation

class Airport: NSObject {

    let airportName : String
    let airportHostCity : String
    let airportCode : String
    let airportID : Int
    let airportLatitude : Double
    let airportLongtitude : Double
    let airportPhoneNumber : String
    
    
    init (airportID:Int, airportName :String, airportCode : String, airportHostCity : String, airportPhoneNumber: String, airportLatitude : Double, airportLongtitude : Double)
    {
        self.airportID = airportID
        self.airportName = airportName
        self.airportCode = airportCode
        self.airportHostCity = airportHostCity
        self.airportPhoneNumber = airportPhoneNumber
        self.airportLatitude = airportLatitude
        self.airportLongtitude = airportLongtitude
    }
    
    init (airportID:Int, airportName :String, airportCode : String, airportHostCity : String, airportLatitude : Double, airportLongtitude : Double)
    {
        self.airportID = airportID
        self.airportName = airportName
        self.airportCode = airportCode
        self.airportHostCity = airportHostCity
        self.airportPhoneNumber = " "
        self.airportLatitude = airportLatitude
        self.airportLongtitude = airportLongtitude
    }
}
