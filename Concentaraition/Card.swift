//
//  Card.swift
//  Concentaraition
//
//  Created by saeed rad on 2018-03-25.
//  Copyright © 2018 saeed rad. All rights reserved.
//

import UIKit

class Card: UIButton {
    var backColor:UIColor = UIColor.orange
    var frontColor:UIColor = UIColor.white
    var emoji:String = "🌺"
    var hiddenColor = UIColor.black
    static var numOfMatches = 0
    static var facedUpCards = Array<Card>()
    /* in the implementatin picture of every card correponds to others in a way that cant be abstracted in a setTheme function but should be set in a setPicture function
     func setTheme(picture aEmoji:String, backColor:UIColor, frontColor:UIColor, hiddenColor:UIColor ){
        self.emoji = aEmoji
        self.backColor = backColor
        self.frontColor = frontColor
        self.hiddenColor = frontColor
    }*/
    private(set) var face:Face = .down
    func setColors(onFront:UIColor, onBack:UIColor ){
        backColor = onBack
        frontColor = onFront
    }
    
    func flip(){
        if !Card.facedUpCards.contains(self){
            if Card.facedUpCards.count == 1 && Card.facedUpCards[0].emoji == self.emoji{
                Card.numOfMatches += 1
                Card.facedUpCards[0].isEnabled = false
                self.isEnabled = false
            }
            if Card.facedUpCards.count >= 2{
                if Card.facedUpCards[0].emoji == Card.facedUpCards[1].emoji{
                    for i in Card.facedUpCards{
                        i.hide()
                    }
                }else{
                    for i in Card.facedUpCards{
                        i.faceDown()
                    }
                }
                Card.facedUpCards.removeAll()
                Card.facedUpCards.append(self)
            }else{
                Card.facedUpCards.append(self)
            }
        }else if Card.facedUpCards.contains(self){
            let _ = Card.facedUpCards.popLast()
        }
        switch face{
        case .up:
            faceDown()
        case .down:
            faceUp()
        }
    }
    func faceDown(){
        backgroundColor = backColor
        setTitle("", for: .normal)
        face = .down
    }
    func faceUp(){
        backgroundColor = frontColor
        setTitle(emoji, for: .normal)
        face = .up
    }
    private func hide(){
        setTitle("", for: .normal)
        backgroundColor = hiddenColor
        isEnabled = false
    }
}
enum Face{
    case up
    case down
}
