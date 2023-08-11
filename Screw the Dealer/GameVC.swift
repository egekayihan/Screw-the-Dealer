//
//  GameVC.swift
//  Screw the Dealer
//
//  Created by Ege Kayihan on 9.08.2023.
//

import UIKit

class GameVC: UIViewController {

    @IBOutlet var cardImageView: UIImageView!
    
    var deck: [String] = []
    var currentCard: UIImage = UIImage(named: "card-cover")!
    var currentCardValue: String = "card-cover"
    var prevCards: [String] = []
    //var defaults = NSUserDefaults.standardUserDefaults
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        deck = Deck.allValues
        
    }

    @IBAction func PrevCardsAction(segue: UIStoryboardSegue, _ sender: UIButton) {
        let destinationVC = segue.destination as! PreviousCardsVC
            destinationVC.passedPrevCards = prevCards
    }
    
    @IBAction func DrawCardAction(_ sender: Any) {
        
        if (deck.isEmpty) {
            performSegue(withIdentifier: "toEndVC", sender: UIButton.self)
        } else {
            //cardImageView.image = deck.randomElement()
            currentCardValue = deck.randomElement()!
            currentCard = UIImage(named: currentCardValue)!
            cardImageView.image = currentCard
            
            deck.remove(at: deck.firstIndex(of: currentCardValue)!)
            prevCards.append(currentCardValue)
            
            print(prevCards)
            
            //defaults.setObject(prevCards, forKey: "prevCards")
        }
    }
    
    
    
    /*@IBAction func performUnwindSegueOperation(_ sender: UIStoryboardSegue) {
    guard let landingVC = sender.source as? PreviousCardsVC else { return }
        landingVC.prevCards = prevCards
    } */
    
}
