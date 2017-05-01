//
//  ViewController.swift
//  hw2
//
//  Created by Student on 14/02/2017.
//  Copyright © 2017 OzU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var gameLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var arrowImage: UIImageView!
    @IBOutlet weak var gameLog: UILabel!
    
    var randomNum : Int = 0
    var guessCounter : Int = 0
    let maxGuess : Int = 3
    var guessedNumber : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomizeNumber()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func guessTheNumber(_ sender: Any) {
        if(playButton.title(for: .normal) == "Restart?"){
            arrowImage.image = nil
            gameLog.text = "Game Log:"
            clearInput()
            randomizeNumber()
            guessCounter = 0
            playButton.setTitle("Guess!", for: .normal)
        }else {
            guessedNumber = Int(textField.text!)
            if (isValid(guess: guessedNumber)){
                warningLabel.text = nil
                gameLog.text =  gameLog.text! + " " + textField.text!
                guessCounter += 1
                continueGame()
            }else{
                warningLabel.text = "Invalid input. Try between 1 and 10."
                clearInput()
            }
        }
    }
    
    func randomizeNumber(){
        randomNum = Int(arc4random_uniform(10)+1)
    }
    
    func clearInput(){
        textField.text = ""
    }
    
    func isValid(guess: Int?)->Bool{ //Invalid inputs are not counted as guesses. No life loss given for them.
        if (guess == nil){
            return false
        }else if(guess! < 1 || guess! > 10){
            return false
        }else{
            return true
        }
    }
    
    func continueGame(){
        if(guessCounter == 3){
            lose()
        }else {
            if(guessedNumber! < randomNum){
                arrowImage.image = UIImage(named: "Up")
            }else if(guessedNumber! > randomNum){
                arrowImage.image = UIImage(named: "Down")
            }else{
                win()
            }
        }
        clearInput()
    }
    
    func lose(){
        arrowImage.image = UIImage(named: "lost")
        playButton.setTitle("Restart?", for: .normal)
    }
    
    func win(){
        arrowImage.image = UIImage(named: "tick")
        playButton.setTitle("Restart?", for: .normal)
    }
}
