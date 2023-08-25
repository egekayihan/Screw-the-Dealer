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
        //print(currentCardValue)
        
        if(currentCardValue != "card-cover" && !deck.isEmpty){
            deck.remove(at: deck.firstIndex(of: currentCardValue)!)
            prevCards.append(currentCardValue)
        }
        
        if (deck.isEmpty) {
            performSegue(withIdentifier: "toEndVC", sender: UIButton.self)
        } else {
            currentCardValue = deck.randomElement()!
            currentCard = UIImage(named: currentCardValue)!
            cardImageView.image = currentCard
            
            //deck.remove(at: deck.firstIndex(of: currentCardValue)!)
            //prevCards.append(currentCardValue)
            
            //print(prevCards)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toPrevCards"){
            let destVC = segue.destination as! PreviousCardsVC
            destVC.passedPrevCards = prevCards
        }
        
        else if(segue.identifier == "toEndVC"){
            _ = segue.destination as! EndVC
        }
    }
    

    
}
