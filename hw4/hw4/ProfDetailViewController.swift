//
//  ProfDetailViewController.swift
//  hw4
//
//  Created by Mutlu Can Gurbuz on 08/03/17.
//  Copyright © 2017 Mutlu Can Gurbuz. All rights reserved.
//

import UIKit

class ProfDetailViewController: UIViewController {

    @IBOutlet weak var profImg: UIImageView!
    @IBOutlet weak var profScoreLabel: UILabel!
    
    var selectedProf : Player?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "\(selectedProf!.playerName) \(selectedProf!.playerLastName)"
        profImg.image = UIImage(named: selectedProf!.playerImageName)
        profScoreLabel.text = "\(selectedProf!.playerScore)"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
