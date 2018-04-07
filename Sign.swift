//
//  Sign.swift
//  RPS
//
//  Created by teresa.odera on 4/6/18.
//  Copyright © 2018 teresa.odera. All rights reserved.
//

import Foundation
import GameplayKit

let randomSelection = GKRandomDistribution(lowestValue: 0, highestValue: 2)
func randomSign() -> Sign{
    let sign = randomSelection.nextInt()
    
    if sign == 0{
        return .rock
    }
    else if sign == 1{
        return .paper
    }
    else{
        return .scissors
    }

}
enum Sign{
    case rock, paper, scissors
    
    var emoji: String {
        switch self{
        case.rock:
            return "👊"
        case.paper:
            return "✋"
        case.scissors:
            return "✌️"
        }//end switch
    }// end emoji
    func firstTurn(_ opponent: Sign) -> GameState{
        switch self {
        case Sign.rock:
            switch opponent {
            case .rock:
                return GameState.draw
            case .paper:
                return GameState.lose
            case .scissors:
                return GameState.win
            }
        case .paper:
            switch opponent {
            case .rock:
                return GameState.win
            case .paper:
                return GameState.draw
            case .scissors:
                return GameState.lose
            }
        case .scissors:
            switch opponent {
            case .rock:
                return GameState.lose
            case .paper:
                return GameState.win
            case .scissors:
                return GameState.draw
            }
        }//end switch self
    
    }//end firstTurn
}//end Sign
