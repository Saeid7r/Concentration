//
//  Theme.swift
//  Concentaraition
//
//  Created by saeed rad on 2018-03-17.
//  Copyright © 2018 saeed rad. All rights reserved.
//

import Foundation
import UIKit

internal struct Theme{
    let emojis:[String]
    let background:UIColor
    let backOfCard:UIColor
    let frontOfCard:UIColor
    init(withEmojis listofEmojis:[String], background:UIColor, backOfCards:UIColor, frontOfCards:UIColor ){
        self.background = background
        self.backOfCard = backOfCards
        self.frontOfCard = frontOfCards
        emojis = listofEmojis
    }
}
