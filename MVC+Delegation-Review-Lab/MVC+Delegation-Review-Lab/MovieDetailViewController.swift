//
//  MovieDetailViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Bienbenido Angeles on 11/20/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

protocol FontSizeDelegate: AnyObject {
    func fontSizePassed(_ viewController: MovieDetailViewController, fontSize: CGFloat)
}

class MovieDetailViewController: UIViewController {
    @IBOutlet weak var userFeedBackLabel: UILabel!
    @IBOutlet weak var fontSizeSlider: UISlider!
    @IBOutlet weak var fontSizeStepper: UIStepper!
    @IBOutlet weak var previewFontSize: UILabel!
    @IBOutlet weak var tempBackButton: UIButton!
    
    var fontSizeD: CGFloat? {
        didSet{
            updatedUI()
//            userFeedBackLabel.font = UIFont.systemFont(ofSize: fontSizeD!)
//            previewFontSize?.text = "Preview Font Size: \(String(format:"%0.f",(fontSizeD!)))"
//            configureSlider()
//            configureStepper()
            delegate?.fontSizePassed(self, fontSize: fontSizeD!)
        }
    }
    
    weak var delegate: FontSizeDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        userFeedBackLabel.text = "Change Table View Font Size"
//        previewFontSize.text = "Preview Font Size: \(String(format:"%0.f",(fontSizeD!)))"
        configureSlider()
        configureStepper()
        updatedUI()
        // Do any additional setup after loading the view.
        tempBackButton.isHidden = true
    }
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        fontSizeD = CGFloat(sender.value)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        fontSizeD = CGFloat(sender.value)
    }
    
    func updatedUI(){
        guard let validFontSize = fontSizeD else {
            fatalError("Could not set fontSize, check prepare(for segue:)")
        }
        userFeedBackLabel?.text = "Change Table View Font Size"
        previewFontSize?.text = "Preview Font Size: \(String(format:"%0.f",(validFontSize)))"
        fontSizeSlider?.value = Float(validFontSize)
        fontSizeStepper?.value = Double(validFontSize)
        userFeedBackLabel?.font = UIFont.systemFont(ofSize: validFontSize)
    }
    
    func configureSlider(){
        fontSizeSlider.minimumValue = 1.0
        fontSizeSlider.maximumValue = 95.0
    }
    
    func configureStepper(){
        fontSizeStepper.minimumValue = 1.0
        fontSizeStepper.maximumValue = 95.0
        fontSizeStepper.stepValue = 1.0
    }

}
