//
//  ViewController.swift
//  CustomTableView
//
//  Created by Dino Musliu on 20/07/2016.
//  Copyright © 2016 Dino Musliu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView : UITableView!
    //var uglyThings = [String]()
    
    var uglyThings = ["http://cdn0.lostateminor.com/wp-content/uploads/2009/02/richard-stipl-2.jpg","https://s-media-cache-ak0.pinimg.com/736x/f1/9a/51/f19a5199180cc1f5c82bb5367fca65b8.jpg", "http://application.denofgeek.com/images/gb/25bb/gremlins2.jpg","http://cdn0.lostateminor.com/wp-content/uploads/2009/02/richard-stipl-2.jpg","https://s-media-cache-ak0.pinimg.com/736x/f1/9a/51/f19a5199180cc1f5c82bb5367fca65b8.jpg"]
    
    var uglyTitles = ["Man this is uuuugly", "This one isn't so bad","I wouldn't want to look like this","Wooo man. NO thanks!","Somebody turn of the screen!"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
            tableView.delegate = self
            tableView.dataSource = self
        
        // mogli smo ih spojiti u mainStorybourdu
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("uglycell") as? UglyCell { //posto trebamo odredeni Cell, moramo kastati sa UglyCell, tj ako smo uspjesno ponovo iskoristili cell (reusable) return it
            
            var img: UIImage!
            
            let url = NSURL(string: uglyThings[indexPath.row])! //kreiramo url
            if let data = NSData(contentsOfURL: url){ //ako možemo downloadamo img
                 img = UIImage(data: data) // kreiramo img
            } else { // ako ne može skinuti sliku s interneta
                img = UIImage(named: "Slika1.jpg")
            }
            
            cell.configureCell(img, text: uglyTitles[indexPath.row]) // title
            
            return cell
        } else {
            return UglyCell() // inace cemo napraviti novu
        }
        
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return uglyThings.count
    }


}

