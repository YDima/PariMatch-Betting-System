//
//  Storage.swift
//  BettingSystem
//
//  Created by Admin on 1/5/21.
//

import Foundation

class Storage {
    var bets: [Bet] = []
    
    init() {
        bets.append(Bet(name: "bet0"))
        bets.append(Bet(name: "bet1"))
        bets.append(Bet(name: "bet2"))
        bets.append(Bet(name: "bet3"))
        bets.append(Bet(name: "bet4"))
        bets.append(Bet(name: "bet5"))
        bets.append(Bet(name: "bet6"))
        bets.append(Bet(name: "bet7"))
    }
}
