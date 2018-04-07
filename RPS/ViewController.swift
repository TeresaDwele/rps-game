//
//  ViewController.swift
//  RPS
//
//  Created by teresa.odera on 4/6/18.
//  Copyright © 2018 teresa.odera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var signLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        reset()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func play(_ playerTurn: Sign){
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorsButton.isEnabled = false
        let opponent = randomSign()
        signLabel.text = opponent.emoji
        let gameResult = playerTurn.firstTurn(opponent)
        switch gameResult {
        case .draw:
            statusLabel.text = "It's a draw"
        case .win:
            statusLabel.text = "You just won!"
        case .lose:
            statusLabel.text = "Sorry you lost"
        case .start:
            statusLabel.text = "Rock, Paper, Scissors"
        }
        
        switch playerTurn {
        case .rock:
            rockButton.isHidden = false
            paperButton.isHidden = true
            scissorsButton.isHidden = true
        case .paper:
            rockButton.isHidden = true
            paperButton.isHidden = false
            scissorsButton.isHidden = true
        case .scissors:
            rockButton.isHidden = true
            paperButton.isHidden = true
            scissorsButton.isHidden = false
        
        }
        playAgainButton.isHidden = false
        playAgainButton.isEnabled = true
    
    }
    @IBAction func playAgainAction(_ sender: Any) {
        reset()
    }

    @IBAction func rockAction(_ sender: Any) {
        play(Sign.rock)
    }

    @IBAction func paperAction(_ sender: Any) {
        play(Sign.paper)
    }
    
    @IBAction func scissorsAction(_ sender: Any) {
        play(Sign.scissors)
    }
    func reset(){
        signLabel.text = "🤖"
        statusLabel.text = "Rock, Paper, Scissors"
        rockButton.isHidden = false
        rockButton.isEnabled = true
        paperButton.isHidden = false
        paperButton.isEnabled = true
        scissorsButton.isHidden = false
        scissorsButton.isEnabled = true
        playAgainButton.isHidden = true
        
    }
    
}

