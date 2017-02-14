//
//  ViewController.swift
//  hw2
//
//  Created by Student on 14/02/2017.
//  Copyright © 2017 OzU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var gameLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var arrowImage: UIImageView!
    
    var randomNum : Int = 0
    var guessCounter : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        randomizeNumber()
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func guessTheNumber(_ sender: Any) {
        if(guessCounter == 3){
            playButton.setTitle("Restart?", for: .normal)
            arrowImage.image = UIImage(named: "lost")
        }
        var guessedNumber : Int?
        if(playButton.title(for: .normal) == "Restart?"){
            randomizeNumber()
            playButton.setTitle("Guess!",for: .normal)
        }else if(playButton.title(for: .normal) == "Guess!"){
            guessCounter += 1
            guessedNumber = Int(textField.text!)
            if(guessedNumber! > randomNum){
                arrowImage.image = UIImage(named: "Down")
            }else if(guessedNumber! < randomNum){
                arrowImage.image = UIImage(named: "Up")
            }else {
                guessCounter = 0
                arrowImage.image = UIImage(named: "tick")
                playButton.setTitle("Restart?", for: .normal)
            }
        }
      }
    
    
    func randomizeNumber(){
         randomNum = Int(arc4random_uniform(10)+1)
    }
}
