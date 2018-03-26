//
//  GameController.swift
//  Concentaraition
//
//  Created by saeed rad on 2018-03-25.
//  Copyright © 2018 saeed rad. All rights reserved.
//

import UIKit

class GameController: UIViewController {
    @IBOutlet var gamePanel: UIView!
    @IBOutlet var gameCards: [Card]!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBAction func restart(_ sender: UIButton) {
        for i in gameCards{
            i.faceDown()
            i.isEnabled = true
        }
        Card.numOfMatches = 0
        Card.facedUpCards.removeAll()
        scoreLabel.text = "Score \(0)"
    }
    let theme = Theme(withEmojis: ["🐶" , "🐱" , "🐭" , "🐹" , "🐰" , "🦊" , "🐻" , "🐼" , "🐨" , "🐯" , "🦁" , "🐮" , "🐷" , "🐽" , "🐸" , "🐵" , "🙊" , "🙉" , "🙊" , "🐒" , "🐔" , "🐧" , "🐦" , "🐤" , "🐣" , "🐥" , "🦆" , "🦅" , "🦉" , "🦇" , "🐺" , "🐗"], background: UIColor.white, backOfCards: UIColor.lightGray, frontOfCards: UIColor.red)
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }
    private func setup(){
        setEnvColors()
        setRandomEmojis(withCardInedixes: getRandomOrder())
    }
    private func setEnvColors(){
        gamePanel.backgroundColor = theme.background
        for card in gameCards{
            card.backgroundColor = theme.backOfCard
            card.backColor = theme.backOfCard
            card.frontColor = theme.frontOfCard
            card.hiddenColor = theme.background
        }
    }
    private func setRandomEmojis(withCardInedixes:Array<Int>){
        let numOfPairs = gameCards.count / 2
        for i in 0..<numOfPairs{
            gameCards[(2*i)+1].emoji = theme.emojis[i]
            gameCards[(i*2)].emoji = theme.emojis[i]
        }
    }
    private func getRandomOrder()->Array<Int>{
        var remainedCards = gameCards.count
        var selectedCards = Array<Int>()
        while remainedCards >= 0{
            selectedCards.append(remainedCards.random(withOut: selectedCards))
            remainedCards-=1
        }
        return selectedCards
    }
    @IBAction func flip(_ sender: Card) {
        sender.flip()
        scoreLabel.text = "Score \(Card.numOfMatches)"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension Int{
    var rand:Int{
        if self>0{
            return Int(arc4random_uniform(UInt32(self)))
        }
        else if self < 0{
            return -Int(arc4random_uniform(UInt32(self)))
        }
        else{
            return 0
        }
    }
    func random(withOut:Array<Int>)->Int{
        var randomValue = rand
        for i in withOut{
            if randomValue > i{
                randomValue += 1
            }
        }
        return randomValue
    }
}


