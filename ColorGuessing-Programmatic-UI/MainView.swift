//
//  MainView.swift
//  ColorGuessing-Programmatic-UI
//
//  Created by Lilia Yudina on 1/28/20.
//  Copyright © 2020 Lilia Yudina. All rights reserved.
//

import UIKit

class MainView: UIView {

       public lazy var display: UIView = {
        let display = UIView()
           return display
       }()
    
  let defaultMessage = "Choose the most dominant color!"
    var currentScore = 0
    var currentHighestScore = 0
  
  public lazy var messageLabel: UILabel = {
      let label = UILabel()
      label.backgroundColor = .yellow
      label.textAlignment = .center
      label.text = defaultMessage
      label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
      return label
  }()
    
    public lazy var currentScoreLabel: UILabel = {
         let label = UILabel()
        label.backgroundColor = .white
         label.textAlignment = .center
        label.text = "Current score: \(currentScore)"
         label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
         return label
     }()
    
    public lazy var highestScoreLabel: UILabel = {
        let label = UILabel()
       label.backgroundColor = .white
        label.textAlignment = .center
       label.text = "Highest score: \(currentHighestScore)"
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    public lazy var redButton: UIButton = {
        let button = UIButton()
      button.backgroundColor = .red
        return button
    }()
    
    public lazy var greenButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        return button
    }()
    
    public lazy var blueButton: UIButton = {
        let button = UIButton()
      button.backgroundColor = .blue
        return button
    }()
    
    public lazy var resetButton: UIButton = {
          let button = UIButton()
        button.backgroundColor = .systemBackground
          button.setTitle("Guess Again", for: .normal)
          button.setTitleColor(.systemRed, for: .normal)
          return button
      }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder){
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupMessageLabelConstraints()
        setupDisplayConstraints()
        setupButtonsConstraints()
        setupResetButtonConstaints()
        setupCurrentScoreLabelConstaints()
        setupHighestScoreLabelConstaints()
    }
    
    private func setupMessageLabelConstraints() {
         addSubview(messageLabel)
        
        
         messageLabel.translatesAutoresizingMaskIntoConstraints = false

        
        
         NSLayoutConstraint.activate([
             messageLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
             messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
             messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
         ])
     }
    
    
    private func setupDisplayConstraints() {
         
          addSubview(display)
          
     
          display.translatesAutoresizingMaskIntoConstraints = false
          
          
           NSLayoutConstraint.activate([
            display.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 20),
               display.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
               display.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.4),
               display.centerXAnchor.constraint(equalTo: centerXAnchor)
           ])
       }
    
      private func setupButtonsConstraints() {
            
        addSubview(redButton)
        addSubview(greenButton)
        addSubview(blueButton)
             
        
             redButton.translatesAutoresizingMaskIntoConstraints = false
             greenButton.translatesAutoresizingMaskIntoConstraints = false
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        
              NSLayoutConstraint.activate([
               redButton.topAnchor.constraint(equalTo: display.bottomAnchor, constant: 20),
               redButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 90),
                  
                  greenButton.topAnchor.constraint(equalTo: display.bottomAnchor, constant: 20),
                  greenButton.leadingAnchor.constraint(equalTo: redButton.trailingAnchor, constant: 75),
       
                  blueButton.topAnchor.constraint(equalTo: display.bottomAnchor, constant: 20),
                    blueButton.leadingAnchor.constraint(equalTo: greenButton.trailingAnchor, constant: 75),
                  
              ])
          }
    
    private func setupResetButtonConstaints() {
    
        addSubview(resetButton)
        
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        
    
        NSLayoutConstraint.activate([
        resetButton.centerXAnchor.constraint(equalTo: centerXAnchor),
        resetButton.topAnchor.constraint(equalTo: display.bottomAnchor, constant: 200)
        ])
    }
    
    private func setupCurrentScoreLabelConstaints() {
     
        addSubview(currentScoreLabel)
         
         currentScoreLabel.translatesAutoresizingMaskIntoConstraints = false
         
     
         NSLayoutConstraint.activate([
         currentScoreLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
         currentScoreLabel.topAnchor.constraint(equalTo: display.bottomAnchor, constant: 100)
         ])
     }
    
    private func setupHighestScoreLabelConstaints() {
    
       addSubview(highestScoreLabel)
        
        highestScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        
    
        NSLayoutConstraint.activate([
        highestScoreLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        highestScoreLabel.topAnchor.constraint(equalTo: display.bottomAnchor, constant: 75)
        ])
    }
    

    
}
