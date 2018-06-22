//
//  RPSMatch.swift
//  RPS
//
//  Created by Нурасыл on 23.06.2018.
//  Copyright © 2018 Нурасыл. All rights reserved.
//

struct RPSMatch {
    
    let p1: RPS
    let p2: RPS
    
    init(p1: RPS, p2: RPS) {
        self.p1 = p1
        self.p2 = p2
    }
    
    var winner: RPS {
        get {
            return p1.defeats(p2) ? p1 : p2
        }
    }
    
    var loser: RPS {
        get {
            return p1.defeats(p2) ? p2 : p1
        }
    }
}
