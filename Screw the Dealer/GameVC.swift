//
//  GameVC.swift
//  Screw the Dealer
//
//  Created by Ege Kayihan on 9.08.2023.
//

import UIKit

class GameVC: UIViewController {

    @IBOutlet var cardImageView: UIImageView!
    
    var deck: [UIImage] = []
    
    var prevCards: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        deck = Deck.allValues
        
    }

    @IBAction func DrawCardAction(_ sender: Any) {
        
        if (deck.isEmpty) {
        self.navigationController?.pushViewController(EndVC(), animated: true)
        } else {
            cardImageView.image = deck.randomElement()
            
            deck.remove(at: deck.firstIndex(of: cardImageView.image!)!)
            prevCards.append(cardImageView.image!)
        }
    }
    
}
