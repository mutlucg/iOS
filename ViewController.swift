//
//  ViewController.swift
//  CardGame
//
//  Created by Student on 09/02/2017.
//  Copyright © 2017 OzU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var PlayButton: UIButton!
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    
    var cardArray : [Int] = []
    
    func shuffle(){
        for i in 1...13 {
            cardArray.append(i)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playTheGame(_ sender: Any) {
        let leftCardIndex = Int(arc4random_uniform(UInt32(cardArray.count)))
        leftImageView.image = UIImage(named: "card\(cardArray[leftCardIndex])")
        cardArray.remove(at : leftCardIndex)
        let rightCardIndex = Int(arc4random_uniform(UInt32(cardArray.count)))
        rightImageView.image = UIImage(named: "card\(cardArray[rightCardIndex])")
        cardArray.remove(at : rightCardIndex)
        
        
        if leftCardIndex > rightCardIndex{
            winLabel.text = "Player 1 wins"
        }else{
            winLabel.text = "Player 2 wins"
        }
        
    }

}

