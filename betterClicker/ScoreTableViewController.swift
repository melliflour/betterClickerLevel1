//
//  ScoreTableViewController.swift
//  betterClicker
//
//  Created by Faith on 27/7/19.
//  Copyright © 2019 Faith. All rights reserved.
//

import UIKit

class ScoreTableViewController: UITableViewController {
  
  var scores: [Float] = []
  var dates: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
  
  @IBAction func unwindToScoreTable(segue: UIStoryboardSegue) {
    if segue.identifier == "exitClicker" {
      let source = segue.source as! ClickerViewController
      scores.append(source.time)
      dates.append(source.date)
      tableView.reloadData()
    }
  }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return scores.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scoreRow", for: indexPath)
      
      if let cellLabel = cell.textLabel {
        let currentScore = scores[indexPath.row]
        cellLabel.text = "\(String(currentScore)) seconds"
      }
      
      if let cellDetailLabel = cell.detailTextLabel {
        let currentDate = dates[indexPath.row]
        cellDetailLabel.text = String(currentDate)
      }

        return cell
    }
  

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

  
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
           scores.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
  

  
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
      let score = scores.remove(at: fromIndexPath.row)
      scores.insert(score, at: to.row)
      tableView.reloadData()
    }
  

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
