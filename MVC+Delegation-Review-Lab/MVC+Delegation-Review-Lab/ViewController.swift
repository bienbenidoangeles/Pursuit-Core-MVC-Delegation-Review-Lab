//
//  ViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Benjamin Stone on 8/19/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var movies = [Movie](){
        didSet{
            tableView.reloadData()
        }
    }
    
    var fontSize:CGFloat! {
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        tableView.dataSource = self
        //navigationController?.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    func loadData(){
        movies = Movie.allMovies
        fontSize = 13.0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "settings"{
            guard let detailVC = segue.destination as? MovieDetailViewController else {
                fatalError("failed to access MovieDetailViewController as dest")
            }
            detailVC.delegate = self
        
            detailVC.fontSizeD = fontSize
        } else {
            fatalError("failed to segue")
        }
    }
    
    @IBAction func settings(segue: UIStoryboardSegue) {
        guard let detailVC = segue.source as? MovieDetailViewController else {
            fatalError("failed to access MovieDetailViewController as src")
        }
        
        fontSize = detailVC.fontSizeD
    }
}

extension ViewController: FontSizeDelegate{
    func fontSizePassed(_ viewController: MovieDetailViewController, fontSize: CGFloat) {
        self.fontSize = fontSize
    }
}

extension ViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        
        let movie = movies[indexPath.row]
        cell.textLabel?.text = movie.name
        cell.detailTextLabel?.text = movie.year.description
        cell.textLabel?.font = UIFont.systemFont(ofSize: fontSize! )
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: fontSize! )
        
        return cell
    }
}

//experimental code
//extension ViewController: UINavigationControllerDelegate{
//    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
//        <#code#>
//    }
//}

