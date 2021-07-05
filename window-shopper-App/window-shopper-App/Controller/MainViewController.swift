//
//  ViewController.swift
//  window-shopper-App
//
//  Created by Юра Маргітич on 05.07.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var wageText: CurrencyTextField!
    @IBOutlet weak var priceText: CurrencyTextField!
    @IBOutlet weak var resultTextLabel: UILabel!
    @IBOutlet weak var hoursTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let calculateButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
        calculateButton.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        calculateButton.setTitle("Calculate", for: .normal)
        calculateButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        
        calculateButton.addTarget(self, action: #selector(calculate), for: .touchUpInside)
        
        wageText.inputAccessoryView = calculateButton
        priceText.inputAccessoryView = calculateButton

        showTextLabel(false)
    }
    
    @objc func calculate() {
        view.endEditing(true)
        
        if let wageText = wageText.text, let priceText = priceText.text {
            if let wage = Double(wageText), let price = Double(priceText) {
                showTextLabel(true)
                resultTextLabel.text = "\(Wage.getHours(forWage: wage, andPrice: price))"
            }
        }
    }

    @IBAction func clearCalculatorTapped(_ sender: Any) {
        showTextLabel(false)
        wageText.text = ""
        priceText.text = ""
    }
    
    private func showTextLabel(_ flag: Bool) {
        resultTextLabel.isHidden = !flag
        hoursTextLabel.isHidden = !flag
    }
}

