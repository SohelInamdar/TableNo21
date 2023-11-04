//
//  ViewController.swift
//  Table21
//
//  Created by TCS on 18/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    var count : Int = 0
    var isTapped : Bool = false
    var player1ToPlay : Bool = true
    var randomResultNumber : Int = Int.random(in: 21...30)
    var p1Name : String = ""
    var p2Name : String = ""
    var textColor : UIColor? = .black
     
    override func viewDidLoad() {
        super.viewDidLoad()
        player1Turn()
        
    }
 
    override func viewWillAppear(_ animated: Bool) {
        
        if p1Name == "" {
            p1Name = "Player1"
            player1NameOutlet.text = "Player1"
        }else{
            player1NameOutlet.text = p1Name
        }
        
        if p2Name == "" {
            p2Name = "Player2"
            player2NameOutlet.text = "Player2"
        }else{
            player2NameOutlet.text = p2Name
        }
    }
    
    
    @IBOutlet weak var player1NameOutlet: UILabel!
    @IBOutlet weak var player2NameOutlet: UILabel!
    @IBOutlet weak var totaCenterResultOutlet: UILabel!
    
    @IBOutlet weak var p1TwoView: UIView!{
        didSet{
            p1TwoView.layer.cornerRadius = 45
        }
    }
    @IBOutlet weak var p1ThreeView: UIView!{
        didSet{
            p1ThreeView.layer.cornerRadius = 45
        }
    }
    @IBOutlet weak var p1FourView: UIView!{
        didSet{
            p1FourView.layer.cornerRadius = 45
        }
    }
    @IBOutlet weak var p2TwoView: UIView!{
        didSet{
            p2TwoView.layer.cornerRadius = 45
        }
    }
    @IBOutlet weak var p2ThreeView: UIView!{
        didSet{
            p2ThreeView.layer.cornerRadius = 45
        }
    }
    @IBOutlet weak var p2FourView: UIView!{
        didSet{
            p2FourView.layer.cornerRadius = 45
        }
    }
    @IBOutlet weak var resultView: UIView!{
        didSet{
            resultView.layer.cornerRadius = 100
        }
    }
    @IBOutlet weak var resultText: UILabel!{
        didSet{
            resultText.text = "Cross \(randomResultNumber) will Lose"
            textColor = resultText.textColor
        }
    }
    
    @IBOutlet weak var viewForResultLabel: UIView!{
        didSet{
            viewForResultLabel.layer.cornerRadius = 20
        }
    }
    

    func afterClickByP1(){
        
        p2TwoView.isUserInteractionEnabled = true
        p2ThreeView.isUserInteractionEnabled = true
        p2FourView.isUserInteractionEnabled = true
        p2TwoView.backgroundColor = .white
        p2ThreeView.backgroundColor = .white
        p2FourView.backgroundColor = .white
        
        p1TwoView.isUserInteractionEnabled = false
        p1ThreeView.isUserInteractionEnabled = false
        p1FourView.isUserInteractionEnabled = false
        p1TwoView.backgroundColor = UIColor(white: 1, alpha: 0.7)
        p1ThreeView.backgroundColor = UIColor(white: 1, alpha: 0.7)
        p1FourView.backgroundColor = UIColor(white: 1, alpha: 0.7)
        
    }
    func afterClickByP2(){
        p1TwoView.isUserInteractionEnabled = true
        p1ThreeView.isUserInteractionEnabled = true
        p1FourView.isUserInteractionEnabled = true
        p1TwoView.backgroundColor = .white
        p1ThreeView.backgroundColor = .white
        p1FourView.backgroundColor = .white
        
        p2TwoView.isUserInteractionEnabled = false
        p2ThreeView.isUserInteractionEnabled = false
        p2FourView.isUserInteractionEnabled = false
        p2TwoView.backgroundColor = UIColor(white: 1, alpha: 0.7)
        p2ThreeView.backgroundColor = UIColor(white: 1, alpha: 0.7)
        p2FourView.backgroundColor = UIColor(white: 1, alpha: 0.7)
        
    }
    
    func player1Turn(){
        p2TwoView.isUserInteractionEnabled = false
        p2ThreeView.isUserInteractionEnabled = false
        p2FourView.isUserInteractionEnabled = false
        p2TwoView.backgroundColor = UIColor(white: 1, alpha: 0.7)
        p2ThreeView.backgroundColor = UIColor(white: 1, alpha: 0.7)
        p2FourView.backgroundColor = UIColor(white: 1, alpha: 0.7)
        p1AddValues()
    }
    
    func colourChange(R:CGFloat,G:CGFloat,B:CGFloat){
        resultView.backgroundColor = UIColor(red: R, green: G, blue: B, alpha: 1)
    }
    
    
    func p1AddValues(){
        
        
        let gestRecogniser1 : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(p1twoViewPressed(_:)))
        gestRecogniser1.numberOfTapsRequired = 1
        p1TwoView.addGestureRecognizer(gestRecogniser1)
        
        let gestRecogniser2 : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(p1ThreeViewPressed(_:)))
        gestRecogniser2.numberOfTapsRequired = 1
        p1ThreeView.addGestureRecognizer(gestRecogniser2)
        
        let gestRecogniser3 : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(p1FourViewPressed(_:)))
        gestRecogniser3.numberOfTapsRequired = 1
        p1FourView.addGestureRecognizer(gestRecogniser3)
        
        let gestRecogniser4 : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(p2twoViewPressed(_:)))
        gestRecogniser4.numberOfTapsRequired = 1
        p2TwoView.addGestureRecognizer(gestRecogniser4)

        let gestRecogniser5 : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(p2ThreeViewPressed(_:)))
        gestRecogniser5.numberOfTapsRequired = 1
        p2ThreeView.addGestureRecognizer(gestRecogniser5)

        let gestRecogniser6 : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(p2FourViewPressed(_:)))
        gestRecogniser6.numberOfTapsRequired = 1
        p2FourView.addGestureRecognizer(gestRecogniser6)
    }
    
    @objc func p1twoViewPressed(_ sender:UITapGestureRecognizer){
        
        guard count < randomResultNumber + 2 else { return }
        count = count + 2
        
        resultNumberCrossed(count: count,playerNumber:p2Name)
        afterClickByP1()
        
        let coOrdinateX = ((sender.view?.frame.origin.x)! + 45)
        let coOrdinateY = ((sender.view?.frame.origin.y)! + 45)

        DispatchQueue.main.async {[weak self] in
            self?.p1AnimateViewToResult(coOrdinateX:coOrdinateX,coOrdinateY:coOrdinateY, view: (self?.p1TwoView)!, count: self?.count ?? 0)
        }
        
        
    }
    @objc func p1ThreeViewPressed(_ sender:UITapGestureRecognizer){
        guard count < randomResultNumber + 2 else { return }
        count = count + 3
        resultNumberCrossed(count: count, playerNumber: p2Name)
        afterClickByP1()
        let coOrdinateX = ((sender.view?.frame.origin.x)! + 45)
        let coOrdinateY = ((sender.view?.frame.origin.y)! + 45)

        DispatchQueue.main.async {[weak self] in
            self?.p1AnimateViewToResult(coOrdinateX:coOrdinateX,coOrdinateY:coOrdinateY, view: (self?.p1ThreeView)!, count: self?.count ?? 0)
        }
        
    }
    @objc func p1FourViewPressed(_ sender:UITapGestureRecognizer){
        guard count < randomResultNumber + 2 else { return }
        count = count + 4
        resultNumberCrossed(count: count, playerNumber: p2Name)
        afterClickByP1()
        let coOrdinateX = ((sender.view?.frame.origin.x)! + 45)
        let coOrdinateY = ((sender.view?.frame.origin.y)! + 45)

        DispatchQueue.main.async {[weak self] in
            self?.p1AnimateViewToResult(coOrdinateX:coOrdinateX,coOrdinateY:coOrdinateY, view: (self?.p1FourView)!, count: self?.count ?? 0)

        }
    }
    
    @objc func p2twoViewPressed(_ sender:UITapGestureRecognizer){
        guard count < randomResultNumber + 2 else { return }
        count = count + 2
        resultNumberCrossed(count: count, playerNumber: p1Name)
        afterClickByP2()
        let coOrdinateX = ((sender.view?.frame.origin.x)! + 45)
        let coOrdinateY = ((sender.view?.frame.origin.y)! + 45)

        DispatchQueue.main.async {[weak self] in
            self?.p2AnimateViewToResult(coOrdinateX:coOrdinateX,coOrdinateY:coOrdinateY, view: (self?.p2TwoView)!, count: self?.count ?? 0)

        }
    }
    @objc func p2ThreeViewPressed(_ sender:UITapGestureRecognizer){
        guard count < randomResultNumber + 2 else { return }
        count = count + 3
        resultNumberCrossed(count: count, playerNumber: p1Name)
        afterClickByP2()
        let coOrdinateX = ((sender.view?.frame.origin.x)! + 45)
        let coOrdinateY = ((sender.view?.frame.origin.y)! + 45)

        DispatchQueue.main.async {[weak self] in
            self?.p2AnimateViewToResult(coOrdinateX:coOrdinateX,coOrdinateY:coOrdinateY, view: (self?.p2ThreeView)!,count: self?.count ?? 0)

        }
    }
    @objc func p2FourViewPressed(_ sender:UITapGestureRecognizer){
        guard count < randomResultNumber + 2 else { return }
        count = count + 4
        resultNumberCrossed(count: count, playerNumber: p1Name)
        afterClickByP2()
        let coOrdinateX = ((sender.view?.frame.origin.x)! + 45)
        let coOrdinateY = ((sender.view?.frame.origin.y)! + 45)

        DispatchQueue.main.async {[weak self] in
            self?.p2AnimateViewToResult(coOrdinateX:coOrdinateX,coOrdinateY:coOrdinateY, view: (self?.p2FourView)!, count: self?.count ?? 0)

        }
    }
    @IBAction func restartButtonPressed(_ sender: UIButton) {
        
        
        let alertController : UIAlertController = UIAlertController(title: "Restart", message: "Click Ok to Start New Game", preferredStyle: .actionSheet)
        
        
        alertController.addAction(UIAlertAction(title: "Ok", style: .default , handler: {_ in
            self.count = 0
            self.afterClickByP2()
            self.randomResultNumber = Int.random(in: 21...30)
            self.totaCenterResultOutlet.text = "\(self.count)"
            self.resultText.text = "Cross \(self.randomResultNumber) will Lose"
            self.resultView.backgroundColor = .white
            self.viewForResultLabel.backgroundColor = .clear
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .destructive))
        present(alertController, animated: true)
        resultText.textColor = textColor
    }
    
    func resultNumberCrossed(count:Int,playerNumber:String){
        
        if count > randomResultNumber || count > randomResultNumber + 1 || count > randomResultNumber + 2{
            resultText.isHidden = false
            resultText.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            resultText.font = .boldSystemFont(ofSize: 20)
            resultText.text = "\(playerNumber) Wins"
            resultView.backgroundColor = .white
//            viewForResultLabel.alpha = 0.7
            viewForResultLabel.backgroundColor = .red
            
        }
    }
    
    func p1AnimateViewToResult(coOrdinateX:CGFloat,coOrdinateY:CGFloat,view:UIView,count :Int){
        
        let animation = CABasicAnimation(keyPath: "position")
        animation.toValue = CGPoint(x: 200, y: 400)
        animation.fromValue = CGPoint(x: coOrdinateX, y: coOrdinateY)
        animation.duration = 1.5
        animation.isRemovedOnCompletion = true
        animation.fillMode = .forwards
        animation.beginTime = CACurrentMediaTime()
        view.layer.add(animation, forKey: nil)
        
        let animationSmallBig = CABasicAnimation(keyPath: "transform.scale")
        animationSmallBig.fromValue = 1
        animationSmallBig.toValue = 1.2
        animation.duration = 0.3
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2, execute: {
            self.resultView.layer.add(animationSmallBig, forKey: "basic")
            self.totaCenterResultOutlet.text = "\(self.count)"
        })


    }
    
    func p2AnimateViewToResult(coOrdinateX:CGFloat,coOrdinateY:CGFloat,view:UIView,count:Int){

        let animation = CABasicAnimation(keyPath: "position")
        animation.toValue = CGPoint(x: 200, y: -30)
        animation.fromValue = CGPoint(x: coOrdinateX, y: coOrdinateY)
        animation.duration = 1.5
        animation.isRemovedOnCompletion = true
        animation.fillMode = .forwards
        animation.beginTime = CACurrentMediaTime()
        view.layer.add(animation, forKey: nil)

        let animationSmallBig = CABasicAnimation(keyPath: "transform.scale")
        animationSmallBig.fromValue = 1
        animationSmallBig.toValue = 1.2
        animation.duration = 0.3
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2, execute: {
            self.resultView.layer.add(animationSmallBig, forKey: "basic")
            self.totaCenterResultOutlet.text = "\(self.count)"

        })
        
    }

}

