//
//  AirportDataSource.swift
//  hw6
//
//  Created by Mutlu Can Gurbuz on 30/03/17.
//  Copyright © 2017 Mutlu Can Gurbuz. All rights reserved.
//

import Foundation

@objc protocol AirportDataDelegate {
    @objc optional func airportListLoaded()
    @objc optional func airportDetailLoaded(airport: Airport)
}

class AirportDataSource: NSObject {
    
    var airportArray : [Airport] = []
    
    var delegate : AirportDataDelegate?
    
    func loadAirportList()
    {
        airportArray.removeAll()
        
        let networkSession = URLSession.shared
        
        var request = URLRequest(url: URL(string: "http://test.imobilecode.com/ozyegin/api/airport")!)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let dataTask = networkSession.dataTask(with: request) { (data, response, error) in
            print("Data downloaded")
            
            let jsonReadable = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print(jsonReadable!)
            
            do
            {
                let jsonAirportArray = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! NSArray
                
                for var airport in jsonAirportArray
                {
                    
                    let airportDictionary = airport as! NSDictionary
                    
                    let newAirport = Airport(airportID: airportDictionary["AirportId"] as! Int, airportName: airportDictionary["AirportName"] as! String, airportCode: airportDictionary["AirportCode"] as! String, airportHostCity: airportDictionary["CityName"] as! String, airportLatitude: airportDictionary["Latitude"] as! Double, airportLongtitude: airportDictionary["Longitude"] as! Double)
                    
                    //Add the Airport to the array
                    self.airportArray.append(newAirport)
                }
                
                //Call the delagete on the target to let it know that the data is retrieved
                self.delegate?.airportListLoaded!()
            }
            catch
            {
                print("We have a JSON exception")
            }
            
            
        }
        
        //This starts the task and downloading
        dataTask.resume()
        print("Downloading data")
    }
    
    func loadAirportDetail(airportId: Int)
    {
        let networkSession = URLSession.shared
        
        var request = URLRequest(url: URL(string: "http://test.imobilecode.com/ozyegin/api/airport/\(airportId)")!)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let dataTask = networkSession.dataTask(with: request) { (data, response, error) in
            print("Data downloaded")
            
            let jsonReadable = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            
            print(jsonReadable!)
            
            do
            {
                let jsonAirport = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! NSDictionary
                
                
                let newAirport = Airport(airportID: jsonAirport["AirportId"] as! Int, airportName :jsonAirport["AirportName"] as! String, airportCode: jsonAirport["AirportCode"] as! String, airportHostCity: jsonAirport["CityName"] as! String, airportPhoneNumber : jsonAirport["PhoneNumber"] as! String, airportLatitude: jsonAirport["Latitude"] as! Double, airportLongtitude: jsonAirport["Longitude"] as! Double)
                
                self.delegate?.airportDetailLoaded!(airport: newAirport)
                
            }
            catch
            {
                print("We have a JSON exception")
            }
            
            
        }
        
        dataTask.resume()
        print("Downloading data")
        
        
    }



}
