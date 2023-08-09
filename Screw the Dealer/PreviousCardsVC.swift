//
//  PreviousCardsVC.swift
//  Screw the Dealer
//
//  Created by Ege Kayihan on 9.08.2023.
//

import UIKit

class PreviousCardsVC: UIViewController {
    var deck: [Deck] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
}

extension PreviousCardsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deck.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CardCell") else {
            return UITableViewCell()
        }
        
        //cell.backgroundColor = colors[indexPath.row]
        
        cell.detailTextLabel?.text = "\(deck[indexPath.row])"
        cell.textLabel?.text = "Reason #\(indexPath.row + 1)"
        
        return cell
    }
    
}

