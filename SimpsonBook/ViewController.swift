//
//  ViewController.swift
//  SimpsonBook
//
//  Created by Italo Stuardo on 26/3/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var simpsonArray = [Simpson]()
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let homer = Simpson(name: "Homer Simpson", job: "Nuclear Safety", image: UIImage(named: "HomerSimpson.png")!)
        let marge = Simpson(name: "Marge Simpson", job: "Housewif", image: UIImage(named: "MargeSimpson.png")!)
        let bar = Simpson(name: "Bart Simpson", job: "Student", image: UIImage(named: "BartSimpson.png")!)
        let lisa = Simpson(name: "Lisa Simpson", job: "Student", image: UIImage(named: "LisaSimpson.png")!)
        let maggie = Simpson(name: "Maggie Simpson", job: "Baby", image: UIImage(named: "MaggieSimpson.png")!)
        
        simpsonArray = [homer, marge, bar, lisa, maggie]
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return simpsonArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        var content = cell.defaultContentConfiguration()
        content.text = simpsonArray[indexPath.row].name
        cell.contentConfiguration = content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "toDetailVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            let destinationVC = segue.destination as? SecondViewController
            destinationVC?.selectedSimpson = simpsonArray[selectedIndex]
        }
    }
}

