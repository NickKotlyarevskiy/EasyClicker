//
//  ViewController.swift
//  Clicker
//
//  Created by Nikita Kotlyarevskiy on 06.03.2024.
//

import UIKit

class ViewController: UIViewController {
    var resultCounter = 0
    var clickPrice = 1
    var actualCount: Float = 0.0
    
    @IBOutlet weak var resultView: UILabel!
    @IBOutlet weak var clickButton: UIButton!
    @IBOutlet weak var plusOneClick: UIButton!
    @IBOutlet weak var TimerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    @IBAction func ButtonClicked(_ sender: UIButton) {
        resultCounter += clickPrice
        resultView.text = String(resultCounter)
    }
    
    @IBAction func plusClickButtonPressed(_ sender: UIButton) {
        if resultCounter >= 100 {
            resultCounter -= 100
            clickPrice += 1
            resultView.text = String(resultCounter)
        }
    }
    
    @IBAction func TimerButtonPressed(_ sender: UIButton) {
        
        if self.resultCounter >= 100 {
            self.resultCounter -= 100
            self.resultView.text = String(self.resultCounter)
            
            _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                if self.actualCount < 9 {
                    self.actualCount += 1.0
                    print(self.actualCount)
                } else {
                    self.resultCounter += 10
                    self.resultView.text = String(self.resultCounter)
                    self.actualCount = 0.0
                }
            }
        }
    }
    
    func updateUI() {
        resultCounter = 101
        resultView.text = String(resultCounter)
        
    }
}

