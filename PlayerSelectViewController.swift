//
//  PlayerSelectViewController.swift
//  Table21
//
//  Created by TCS on 13/10/23.
//

import UIKit

class PlayerSelectViewController: UIViewController {

    @IBOutlet weak var viewForPlayer1And2: UIView!{
        didSet{
            viewForPlayer1And2.layer.cornerRadius = 20
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func player1ButtonTapped(_ sender: UIButton) {
        
        let destinationVC = self.storyboard?.instantiateViewController(identifier: "gameViewController") as! ViewController
        destinationVC.modalTransitionStyle = .coverVertical
        destinationVC.modalPresentationStyle = .currentContext
        self.navigationController?.pushViewController(destinationVC, animated: true)
        
        
    }
    
    @IBAction func player2ButtonTapped(_ sender: UIButton) {
        let destinationVC = self.storyboard?.instantiateViewController(identifier: "HomePageViewController") as! HomePageViewController
        destinationVC.modalTransitionStyle = .coverVertical
        destinationVC.modalPresentationStyle = .currentContext
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
    

}
