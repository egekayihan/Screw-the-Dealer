//
//  PreviousCardsVC.swift
//  Screw the Dealer
//
//  Created by Ege Kayihan on 9.08.2023.
//

import UIKit

class PreviousCardsVC: UIViewController {
    var deck: [Deck] = []
    var cardValues: [String] = ["A", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
    var prevCards = GameVC().prevCards
    //var prevCards : [String] = []
    var passedPrevCards : [String] = []
    
    //let destinationVC = GameVC()
        
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //destinationVC.prevCards = passedPrevCards
        
        print(prevCards)
        print(passedPrevCards)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension PreviousCardsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardValues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if (!prevCards.isEmpty) {
            cell.textLabel?.text = "\(cardValues[indexPath.row]) = \(prevCards[indexPath.row])"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you tapped me")
    }
    
    
    
}

