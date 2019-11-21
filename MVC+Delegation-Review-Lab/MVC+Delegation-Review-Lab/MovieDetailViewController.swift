//
//  MovieDetailViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Bienbenido Angeles on 11/20/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    @IBOutlet weak var userFeedBackLabel: UILabel!
    @IBOutlet weak var fontSizeSlider: UISlider!
    @IBOutlet weak var fontSizeStepper: UIStepper!
    @IBOutlet weak var previewFontSize: UILabel!
    
    var fontSizeD: CGFloat? {
        didSet{
            userFeedBackLabel.font = UIFont.systemFont(ofSize: fontSizeD!)
            previewFontSize.text = "Preview Font Size: \(Int(fontSizeD!))"
            configureSlider()
            configureStepper()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        previewFontSize.text = "Preview Font Size: \(fontSizeD)"
        configureSlider()
        configureStepper()
        // Do any additional setup after loading the view.
    }
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        fontSizeD = CGFloat(sender.value)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        fontSizeD = CGFloat(sender.value)
    }
    
    func configureSlider(){
        fontSizeSlider.minimumValue = 1.0
        fontSizeSlider.maximumValue = 80.0
        fontSizeSlider.value = Float(fontSizeD!)
    }
    
    func configureStepper(){
        fontSizeStepper.minimumValue = 1.0
        fontSizeStepper.maximumValue = 80.0
        fontSizeStepper.stepValue = 1.0
        fontSizeStepper.value = Double(fontSizeD!)
    }

    

}
