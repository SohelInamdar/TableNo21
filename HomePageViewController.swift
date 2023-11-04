//
//  HomePageViewController.swift
//  Table21
//
//  Created by TCS on 19/09/23.
//

import UIKit

class HomePageViewController: UIViewController {
    var p1Name : String = ""
    var p2Name : String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBOutlet weak var registrationView: UIView!{
        didSet{
            registrationView.layer.cornerRadius = 10
        }
    }
    
    @IBOutlet weak var P1NameTextField: UITextField!
    @IBOutlet weak var p2NameTextField: UITextField!
    
    @IBAction func p1NameTFAction(_ sender: UITextField) {
        p1Name = sender.text ?? ""
    }
    
    @IBAction func p2NameTFAction(_ sender: UITextField) {
        p2Name = sender.text ?? ""
    }
    
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
       
        
//        guard !p1Name.isEmpty || !p2Name.isEmpty || p1Name != "" || p2Name != "" else{
//
//            let alert = UIAlertController(title: "Alert", message: "Please Enter player Names", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "Ok", style: .default))
//            self.present(alert, animated: true)
//            return
//        }
        
        let gameViewController = (self.storyboard?.instantiateViewController(identifier: "gameViewController"))! as ViewController
        self.present(gameViewController, animated: true)
        gameViewController.p1Name = p1Name
        gameViewController.p2Name = p2Name
        
    }
    
    
}

extension HomePageViewController:UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    
    
}
