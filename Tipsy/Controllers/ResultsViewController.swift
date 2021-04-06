//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Ilya on 05.04.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var resultValue: String = "0.0"
    var tipValue: Int = 10
    var peopleToSplit: Int = 2

    @IBOutlet weak var totalValue: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalValue.text = resultValue
        settingsLabel.text = "Split between \(peopleToSplit) people, with \(tipValue)% tip."
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
