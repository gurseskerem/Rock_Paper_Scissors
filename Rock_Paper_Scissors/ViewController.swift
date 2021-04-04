//
//  ViewController.swift
//  Rock_Paper_Scissors
//
//  Created by Kerem Gurses on 28.03.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var cpuLabel: UILabel!
    @IBOutlet weak var cpuImage: UIImageView!
    
    @IBOutlet weak var playerLabel: UILabel!
    @IBOutlet weak var playerImage: UIImageView!
    
    
    @IBOutlet weak var endGameButton: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var recordData:String!

    //var data = [String]()
    
    //defining player's points
    var playerPoints = 0
    var cpuPoints = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let userDefaults = Foundation.UserDefaults.standard
        let value = userDefaults.string(forKey: "Record")
        recordData = value
    }
    
    
    @IBAction func endGameClicked(_ sender: Any) {
        
            
        //let score1 = playerPoints-cpuPoints
        //let myScore = String(score1)
        if recordData == nil {
            let savedString = scoreLabel.text
            let userDefaults = Foundation.UserDefaults.standard
            userDefaults.set(savedString, forKey: "Record")}
        else{
            let score:Int? = Int(scoreLabel.text!)
            let record:Int? = Int(recordData)
            
            if score! > record! {
                let savedString = scoreLabel.text
                let userDefaults = Foundation.UserDefaults.standard
                userDefaults.set(savedString, forKey: "Record")
            }
        }

        
        
        let vc = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "endGame") as! EndGameViewController
        //self.scoreLabel.text = myScore
        vc.scoreData = scoreLabel.text
        self.present(vc, animated: false, completion: nil)
        
    }
    /*
    extension ViewController: UITableViewDelegate, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return data.count
        }
    }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "EditTableViewCell", for: indexPath) as? EditTableViewCell else {return UITableViewCell()}
            cell.lblName.text = data[indexPath.row]
            return cell
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 70
        }
        func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
            return .delete
        }
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                tableView.beginUpdates()
                data.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                tableView.endUpdates()
            }
        }
    
    
    
   
    
    */
    
    @IBAction func rockButton(_ sender: Any) {
        //generating numbers for both players
        let playerNumber = 1
        let cpuNumber = Int.random(in: 1...3)
        //rock = 1, paper = 2, scissors = 3
        
        //setting the images accorting to the numbers
        setHandImage(imageView: cpuImage, imageNumber: cpuNumber)
        setHandImage(imageView: playerImage, imageNumber: playerNumber)
        
        //calculating the winner
        
        //cpu = rock, player = rock
        if cpuNumber == 1 {
            print("draw")
        }
        //cpu = paper, player = rock
        if cpuNumber == 2 {
            cpuPoints = cpuPoints + 1
        }
        //cpu = scissors, player = rock
        if cpuNumber == 3 {
            playerPoints = playerPoints + 1
        }
        //display the scores
        scoreLabel.text = "\(playerPoints-cpuPoints)"
        //playerLabel.text = "YOU: \(playerPoints)"
        
        //add a little animation if you want
        UIView.transition(with: cpuImage, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
        UIView.transition(with: playerImage, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
    }
    
    @IBAction func scissorsButton(_ sender: Any) {
        //generating numbers for both players
        let playerNumber = 3
        let cpuNumber = Int.random(in: 1...3)
        
        
        //rock = 1, paper = 2, scissors = 3
        
        //setting the images accorting to the numbers
        setHandImage(imageView: cpuImage, imageNumber: cpuNumber)
        setHandImage(imageView: playerImage, imageNumber: playerNumber)
        
        //calculating the winner
    
        //cpu = rock, player = scissors
        if cpuNumber == 1 {
            cpuPoints = cpuPoints + 1
        }
        
        //cpu = paper, player = scissors
        if cpuNumber == 2  {
            playerPoints = playerPoints + 1
        }
        
        //cpu = scissors, player = scissors
        if cpuNumber == 3  {
            print("draw")
        }
        
        //display the scores
        scoreLabel.text = "\(playerPoints-cpuPoints)"        //cpuLabel.text = "OPPONENT: \(cpuPoints)"
        //playerLabel.text = "YOU: \(playerPoints)"
        
        //add a little animation if you want
        UIView.transition(with: cpuImage, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
        UIView.transition(with: playerImage, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
    }
    
    
    @IBAction func paperButton(_ sender: Any) {
        //generating numbers for both players
        let playerNumber = 2
        let cpuNumber = Int.random(in: 1...3)
        
        
        //rock = 1, paper = 2, scissors = 3
        
        //setting the images accorting to the numbers
        setHandImage(imageView: cpuImage, imageNumber: cpuNumber)
        setHandImage(imageView: playerImage, imageNumber: playerNumber)
        
        //calculating the winner
        
       
        //cpu = rock, player = paper
        if cpuNumber == 1 {
            playerPoints = playerPoints + 1
        }
        
        
        //cpu = paper, player = paper
        if cpuNumber == 2 {
            print("draw")
        }
        
        
        //cpu = scissors, player = paper
        if cpuNumber == 3  {
            cpuPoints = cpuPoints + 1
        }
        
        
        //display the scores
        scoreLabel.text = "\(playerPoints-cpuPoints)"        //cpuLabel.text = "OPPONENT: \(cpuPoints)"
        //playerLabel.text = "YOU: \(playerPoints)"
        
        //add a little animation if you want
        UIView.transition(with: cpuImage, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
        UIView.transition(with: playerImage, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
    }
    
    @IBAction func randomButton(_ sender: Any) {
        //generating numbers for both players
        let playerNumber = Int.random(in: 1...3)
        let cpuNumber = Int.random(in: 1...3)
        
        
        //rock = 1, paper = 2, scissors = 3
        
        //setting the images accorting to the numbers
        setHandImage(imageView: cpuImage, imageNumber: cpuNumber)
        setHandImage(imageView: playerImage, imageNumber: playerNumber)
        
        //calculating the winner
        
       
        //cpu = rock, player = paper
        if cpuNumber == 1 && playerNumber == 2{
            playerPoints = playerPoints + 1
        }
        
        
        //cpu = paper, player = paper
        if cpuNumber == 2 && playerNumber == 2{
            print("draw")
        }
        
        
        //cpu = scissors, player = paper
        if cpuNumber == 3 && playerNumber == 2{
            cpuPoints = cpuPoints + 1
        }
        if cpuNumber == 1 && playerNumber == 1{
            print("draw")
        }
        
        
        //cpu = paper, player = paper
        if cpuNumber == 2 && playerNumber == 1{
            cpuPoints = cpuPoints + 1        }
        
        
        //cpu = scissors, player = paper
        if cpuNumber == 3 && playerNumber == 1{
            playerPoints = playerPoints + 1
        }
        if cpuNumber == 1 && playerNumber == 3{
            cpuPoints = cpuPoints + 1 
        }
        
        
        //cpu = paper, player = paper
        if cpuNumber == 2 && playerNumber == 3{
            playerPoints = playerPoints + 1
            
        }
        
        
        //cpu = scissors, player = paper
        if cpuNumber == 3 && playerNumber == 3{
            print("draw")
            
        }
        
        
        //display the scores
        scoreLabel.text = "\(playerPoints-cpuPoints)"        //cpuLabel.text = "OPPONENT: \(cpuPoints)"
        //playerLabel.text = "YOU: \(playerPoints)"
        
        //add a little animation if you want
        UIView.transition(with: cpuImage, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
        UIView.transition(with: playerImage, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
    }
    
    
    
    
    
    //help with setting the images
    func setHandImage(imageView:UIImageView, imageNumber:Int) {
        switch imageNumber {
        case 1:
            imageView.image = UIImage(named: "rock")
        case 2:
            imageView.image = UIImage(named: "paper")
        case 3:
            imageView.image = UIImage(named: "scissors")
        default:
            print("error")
        }
    }
}


