//
//  ViewController.swift
//  betterClicker
//
//  Created by Faith on 27/7/19.
//  Copyright © 2019 Faith. All rights reserved.
//

import UIKit

class ClickerViewController: UIViewController {
  
  @IBOutlet weak var scoreLabel: UILabel!
  var counter = 0
  var time: Float = 0
  var goal = 1
  var date: String = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    Timer.scheduledTimer(timeInterval: 0.1, target: self, selector:#selector(update), userInfo: nil, repeats: true)
  }
  
  @objc
  func update() {
    time += 0.1
  }
  
  @objc func currentDate(){
    let formatter = DateFormatter()
    formatter.dateFormat = "dd/MM/yyyy HH:mm"
    date = formatter.string(from: Date())
    print(date)
  }

  @IBAction func tapped(_ sender: Any) {
    counter += 1
    scoreLabel.text = String(counter)
    if counter == goal {
      currentDate()
      print("Reached \(goal) clicks in \(time) seconds!")
      performSegue(withIdentifier: "exitClicker", sender: self)
    }
  }
  
}

