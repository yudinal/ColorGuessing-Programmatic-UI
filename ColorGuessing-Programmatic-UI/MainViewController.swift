//
//  ViewController.swift
//  ColorGuessing-Programmatic-UI
//
//  Created by Lilia Yudina on 1/28/20.
//  Copyright © 2020 Lilia Yudina. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    private let mainView = MainView()
    
    private let colorChoice = ColorGuessingModel()
    
    override func loadView() {
        view = mainView
    }
    
    var realColor = UIColor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.display.backgroundColor = colorChoice.getNewColor()
        mainView.redButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        mainView.greenButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        mainView.blueButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        mainView.resetButton.addTarget(self, action: #selector(playAgain(_:)), for: .touchUpInside)
        view.backgroundColor = .white
        
    }
    
    @objc private func buttonPressed(_ sender: UIButton) {
        
        guard mainView.display.backgroundColor != nil else { return }
        
        if colorChoice.isDominant(guess: sender.backgroundColor!) {
            mainView.currentScore += 1
            mainView.currentScoreLabel.text = "Your score: \(mainView.currentScore)"
            if mainView.currentScore >= mainView.currentHighestScore {
                mainView.currentHighestScore = mainView.currentScore
                mainView.highestScoreLabel.text = "Highest score: \(mainView.currentHighestScore)"
            }
        } else {
            mainView.currentScore = 0
            mainView.currentScoreLabel.text = "Your score: \(mainView.currentScore)"
            if mainView.currentScore >= mainView.currentHighestScore {
                mainView.currentHighestScore = mainView.currentScore
                mainView.highestScoreLabel.text = "Highest score: \(mainView.currentHighestScore)"
            }
            
        }
        mainView.currentScoreLabel.text = "Your score: \(mainView.currentScore)"
        mainView.display.backgroundColor = colorChoice.getNewColor()
        mainView.highestScoreLabel.text = "Highest score: \(mainView.currentHighestScore)"
    }
    
    @objc private func playAgain(_ sender: UIButton) {
        mainView.display.backgroundColor = colorChoice.getNewColor()
        mainView.currentScore = 0
        mainView.currentScoreLabel.text = "Current score: \(mainView.currentScore)"
    }
    
}

