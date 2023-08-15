//
//  PreviousCardsVC.swift
//  Screw the Dealer
//
//  Created by Ege Kayihan on 9.08.2023.
//

import UIKit

class PreviousCardsVC: UIViewController {
    var deck: [Deck] = []
    var cardValues: [String] = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
    var passedPrevCards : [String] = []
    var prevCards : [Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(passedPrevCards)
        countValueNumbers()
        
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
        
        if (!passedPrevCards.isEmpty) {
            cell.textLabel?.text = "\(cardValues[indexPath.row]) = \(prevCards[indexPath.row]) / 4"
                        
            if((cell.textLabel!.text?.suffix(5) == "4 / 4")){
                cell.backgroundColor = .green
            }
            else if((cell.textLabel!.text?.suffix(5) == "3 / 4")){
                cell.backgroundColor = .yellow
            }
            else if((cell.textLabel!.text?.suffix(5) == "2 / 4")){
                cell.backgroundColor = .orange
            }
            else if((cell.textLabel!.text?.suffix(5) == "1 / 4")){
                cell.backgroundColor = .red
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you tapped me")
    }
    
    func countValueNumbers() {
        for card in passedPrevCards {
            for value in cardValues {
                if (card.prefix(2) == "10"){
                    prevCards[cardValues.firstIndex(of: String(card.prefix(2)))!] += 1
                    break
                } else if (card.prefix(1) == value) {
                        prevCards[cardValues.firstIndex(of: value)!] += 1
                        break
                }
                    
                
                    
            }
            //print("previous cards: \(prevCards)")
        }
    }
    
    
    
}

