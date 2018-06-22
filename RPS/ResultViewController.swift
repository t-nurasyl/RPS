//
//  ResultViewController.swift
//  RPS
//
//  Created by Нурасыл on 23.06.2018.
//  Copyright © 2018 Нурасыл. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var match: RPSMatch!
    var message: NSString!
    var picture: UIImage!
    
    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    override func viewWillAppear(_ animated:Bool) {
        super.viewWillAppear(animated)
        self.messageLabel.text = messageForMatch(match)
        self.resultImageView.image = imageForMatch(match)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1.5)
        {
            self.resultImageView.alpha = 1;
        }
    }
    
    @IBAction func playAgainButtonPressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    func messageForMatch(_ match: RPSMatch) -> String {
        
        if match.p1 == match.p2 {
            return "It's a tie!"
        }
        
        return match.winner.description + " " + victoryModeString(match.winner) + " " + match.loser.description + ". " + resultString(match)
    }
    
    func resultString(_ match: RPSMatch) -> String {
        return match.p1.defeats(match.p2) ? "You Win!" : "You Lose!"
    }
    
    
    func victoryModeString(_ gesture: RPS) -> String {
        switch (gesture) {
        case .rock:
            return "crushes"
        case .scissors:
            return "cuts"
        case .paper:
            return "covers"
        }
    }
    
    func imageForMatch(_ match: RPSMatch) -> UIImage {
        
        var name = ""
        
        switch (match.winner) {
        case .rock:
            name = "RockCrushesScissors"
        case .paper:
            name = "PaperCoversRock"
        case .scissors:
            name = "ScissorsCutPaper"
        }
        
        if match.p1 == match.p2 {
            name = "itsATie"
        }
        return UIImage(named: name)!
    }
}
