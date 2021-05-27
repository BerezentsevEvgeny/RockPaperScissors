//
//  ViewController.swift
//  RPS
//
//  Created by Евгений on 13.11.2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var computerLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resetBoard()
    }
    
    // Сброс
    func resetBoard() {
        computerLabel.text = "🤖"
        statusLabel.text = "Rock, Paper, Scissors?"
        rockButton.isHidden = false
        rockButton.isEnabled = true
        paperButton.isHidden = false
        paperButton.isEnabled = true
        scissorsButton.isHidden = false
        scissorsButton.isEnabled = true
        playAgainButton.isHidden = true
    }
    
    // Логика
    func play(_ playerTurn: Sign) {
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorsButton.isEnabled = false
    
        let opponent = randomSign()
        computerLabel.text = opponent.emoji
        
        let gameResult = playerTurn.takeTurn(opponent)
        
        switch gameResult {
        case .draw:
            statusLabel.text = "It's a draw."
        case .lose:
            statusLabel.text = "Ssory, you lose."
        case .win:
            statusLabel.text = "You win!"
        case .start:
            statusLabel.text = "Rock, Paper, Scissors?"
        }
        
        switch playerTurn {
        case .rock:
            rockButton.isHidden = false
            paperButton.isHidden = true
            scissorsButton.isHidden = true
        case .paper:
            paperButton.isHidden = false
            rockButton.isHidden = true
            scissorsButton.isHidden = true
        case .scissors:
            scissorsButton.isHidden = false
            rockButton.isHidden = true
            paperButton.isHidden = true
        }
        playAgainButton.isHidden = false
    }
    
    // MARK: - Действия
    
    @IBAction func playAgainSelected(_ sender: UIButton) {
        resetBoard()
    }
    
    @IBAction func rockSelected(_ sender: UIButton) {
        play(Sign.rock)
    }
    
    @IBAction func paperSelected(_ sender: UIButton) {
        play(Sign.paper)
    }
    
    @IBAction func scissorsSelected(_ sender: UIButton) {
        play(Sign.scissors)
    }
    
    
}

