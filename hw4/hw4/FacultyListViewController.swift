//
//  FacultyListViewController.swift
//  hw4
//
//  Created by Mutlu Can Gurbuz on 08/03/17.
//  Copyright © 2017 Mutlu Can Gurbuz. All rights reserved.
//

import UIKit

class FacultyListViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    
    @IBOutlet weak var profImg1: UIImageView!
    @IBOutlet weak var profImg2: UIImageView!
    @IBOutlet weak var profImg3: UIImageView!
    @IBOutlet weak var profImg4: UIImageView!
    @IBOutlet weak var profImg5: UIImageView!
    @IBOutlet weak var profImg6: UIImageView!
    
    @IBOutlet weak var profLabel1: UILabel!
    @IBOutlet weak var profLabel2: UILabel!
    @IBOutlet weak var profLabel3: UILabel!
    @IBOutlet weak var profLabel4: UILabel!
    @IBOutlet weak var profLabel5: UILabel!
    @IBOutlet weak var profLabel6: UILabel!
    
    let playerDataSource = TopPlayerDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = "Faculty List"
        
        let prof1 = playerDataSource.playerArray[0]
        let prof2 = playerDataSource.playerArray[1]
        let prof3 = playerDataSource.playerArray[2]
        let prof4 = playerDataSource.playerArray[3]
        let prof5 = playerDataSource.playerArray[4]
        let prof6 = playerDataSource.playerArray[5]
        
        
        profImg1.image = UIImage(named: prof1.playerImageName)
        profLabel1.text = "\(prof1.playerName) \(prof1.playerLastName)"
        
        profImg2.image = UIImage(named: prof2.playerImageName)
        profLabel2.text = "\(prof2.playerName) \(prof2.playerLastName)"
        
        profImg3.image = UIImage(named: prof3.playerImageName)
        profLabel3.text = "\(prof3.playerName) \(prof3.playerLastName)"
        
        profImg4.image = UIImage(named: prof4.playerImageName)
        profLabel4.text = "\(prof4.playerName) \(prof4.playerLastName)"
        
        profImg5.image = UIImage(named: prof5.playerImageName)
        profLabel5.text = "\(prof5.playerName) \(prof5.playerLastName)"
        
        profImg6.image = UIImage(named: prof6.playerImageName)
        profLabel6.text = "\(prof6.playerName) \(prof6.playerLastName)"
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let playerDetailController = segue.destination as! ProfDetailViewController
        
        let buttonSelected = sender as! UIButton
        
        if buttonSelected == button1
        {
            let prof = playerDataSource.playerArray[0]
            playerDetailController.selectedProf = prof
            
        }
        else if buttonSelected == button2
        {
            let prof = playerDataSource.playerArray[1]
            playerDetailController.selectedProf = prof
            
        }
        else if buttonSelected == button3
        {
            let prof = playerDataSource.playerArray[2]
            playerDetailController.selectedProf = prof
            
        }
        else if buttonSelected == button4
        {
            let prof = playerDataSource.playerArray[3]
            playerDetailController.selectedProf = prof
            
        }
        else if buttonSelected == button5
        {
            let prof = playerDataSource.playerArray[4]
            playerDetailController.selectedProf = prof
            
        }
        else if buttonSelected == button6
        {
            let prof = playerDataSource.playerArray[5]
            playerDetailController.selectedProf = prof
            
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
