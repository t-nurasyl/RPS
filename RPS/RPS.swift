//
//  RPS.swift
//  RPS
//
//  Created by Нурасыл on 23.06.2018.
//  Copyright © 2018 Нурасыл. All rights reserved.
//

import Foundation

enum RPS {
    case rock, paper, scissors
    
    init() {
        switch arc4random() % 3 {
            
        case 0:
            self = .rock
        case 1:
            self = .paper
        default:
            self = .scissors
        }
    }
    
    func defeats(_ opponent: RPS) -> Bool {
        switch (self, opponent) {
        case (.paper, .rock), (.scissors, .paper), (.rock, .scissors):
            return true;
        default:
            return false;
        }
    }
}

extension RPS: CustomStringConvertible {
    
    var description: String {
        get {
            switch (self) {
            case .rock:
                return "Rock"
            case .paper:
                return "Paper"
            case .scissors:
                return "Scissors"
            }
        }
    }
}
