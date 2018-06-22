//
//  ViewController.swift
//  RPS
//
//  Created by Нурасыл on 23.06.2018.
//  Copyright © 2018 Нурасыл. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var match: RPSMatch!
    
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    
    @IBAction func makeYourMove(_ sender: UIButton) {
        
        switch (sender) {
        case self.rockButton:
            throwDown(RPS.rock)
            
        case self.paperButton:
            throwDown(RPS.paper)
            
        case self.scissorsButton:
            throwDown(RPS.scissors)
            
        default:
            assert(false, "An unknown button is invoking makeYourMove()")
        }
    }
    
    func throwDown(_ playersMove: RPS)
    {
        let computersMove = RPS()
        self.match = RPSMatch(p1: playersMove, p2: computersMove)
        
        if (playersMove == RPS.rock) {
            let storyboard = UIStoryboard (name: "Main", bundle: nil)
            let resultVC = storyboard.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
            
            resultVC.match = self.match
            self.present(resultVC, animated: true, completion: nil)
        }
        else if (playersMove == RPS.paper) {
            performSegue(withIdentifier: "throwDownPaper", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let controller = segue.destination as! ResultViewController
        controller.match = self.match
    }
}
