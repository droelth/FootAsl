//
//  ViewController.swift
//  FootAsl
//
//  Created by Berkay Sutlu on 13.01.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
            super.viewDidLoad()

        
    }
    @IBOutlet weak var lblt1: UILabel!
    
    
    @IBOutlet weak var lblt2: UILabel!
    
    @IBOutlet weak var lbl1: UILabel!
    
    @IBOutlet weak var lbl2: UILabel!
    
    @IBAction func btnClicked(_ sender: UIButton) {
        lbl1.text = ""
        lbl2.text = ""
        getTheNames(team1: real.name, team2: barca.name)
        eventChance(ap1: real.attackpower, ap2: barca.attackpower, dp1: real.defencepower, dp2: barca.defencepower)
    }
    
    
    // Class'tan gelen takımlar
    let real = footballTeam(name: "realMadrid", attackpower: 93, defencepower: 70)
    let barca = footballTeam(name: "barcelona", attackpower: 90, defencepower: 67)
    let city = footballTeam(name: "manchester city", attackpower: 95, defencepower: 78)
    let liv = footballTeam(name: "liverpool", attackpower: 92, defencepower: 80)
    var team1Score = 0
    var team2Score = 0
    
    func howManyTry(ap1: Int, ap2: Int) -> Int {
        return ((ap1 + ap2) / 20)
    }
    
    func whoScores(ap1: Int, ap2: Int, dp1: Int, dp2: Int) -> Int {
        let c1 = ap1 - dp2
        let c2 = ap2 - dp1
        let rnd1 = Int.random(in: 1...c2)
        let rnd2 = Int.random(in: 1...c1)
        
        if rnd1 == rnd2 {
            return 0
        }
        else if rnd1 > rnd2 {
            return 1
        }
        else {
            return 2
        }
    }
    
    func getTheNames(team1: String, team2: String){
        lblt1.text = team1
        lblt2.text = team2
    }
    
    func eventChance(ap1: Int, ap2: Int, dp1: Int, dp2: Int)
    {
        
        team1Score = 0
        team2Score = 0
        // how many times will there be events
        
        let eventNumber = howManyTry(ap1: ap1, ap2: ap2)
        print("\(eventNumber)")
        for _ in 1...eventNumber
        {
        //    var no = 0
            let no = whoScores(ap1: ap1, ap2: ap2, dp1: dp1, dp2: dp2)
            print("\(no)")
            scoreHolder(no: no)
        }
        cutTheGoal(a: team1Score, b: team2Score)
        lbl1.text = String(team1Score)
        lbl2.text = String(team2Score)
        
    }
    
    func scoreHolder(no: Int){
        if no == 1 {
            team1Score += 1
        }
        else if no == 2 {
            team2Score += 1
        }
        else
        {
            
        }
    }
    
    func cutTheGoal(a: Int, b: Int){
        if a > b {
           team1Score = team1Score - team2Score
            team2Score = 0
        }
        else if b > a {
            team2Score = team2Score - team1Score
            team1Score = 0
        }
        else
        {
            
        }
    }
    
    
//    func randomAttackPower(attackpower: Double) -> Double {
//        let randomChance = attackpower / 10
//
//        return rnd
    }



