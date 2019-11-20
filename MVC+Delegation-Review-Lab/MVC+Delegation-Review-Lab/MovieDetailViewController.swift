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
    
    var fontSize: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
