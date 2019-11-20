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
    
    var fontSize = CGFloat(20.0) {
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func loadData(){
        movies = Movie.allMovies
    }
    
    @IBAction func settings(segue: UIStoryboardSegue) {
        guard let detailVC = segue.source as? MovieDetailViewController else {
            fatalError("failed to access MovieDetailViewController")
        }
        
        //fontSize = detailVC
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
        cell.textLabel?.font = UIFont(name: "Times New Roman", size: fontSize)
        
        return cell
    }
}

