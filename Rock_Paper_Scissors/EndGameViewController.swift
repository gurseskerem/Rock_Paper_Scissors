//
//  EndGameViewController.swift
//  Rock_Paper_Scissors
//
//  Created by Kerem Gurses on 4.04.2021.
//

import UIKit

class EndGameViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var saveMyScoreButton: UIButton!
    
    var scoreData:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = scoreData
        //self.scoreLabel.text = scoreData
        // Do any additional setup after loading the view.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
