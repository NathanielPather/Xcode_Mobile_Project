//
//  ViewController.swift
//  Fun
//
//  Created by Nathaniel Pather on 6/05/2018.
//  Copyright © 2018 Nathaniel Pather. All rights reserved.
//

/* Goals
 
 Display data array somewhere
    Perhaps as a tableview
 
 */

import UIKit

class ViewController: UIViewController {
    // data
    var data = [String]()
    
// UI elements
    @IBAction func helloButton(sender: AnyObject) {
        helloLabel.text = useData()
        if nameTextfield.text != "" {
            let newPerson = PersonData.init(person: nameTextfield.text!)
            helloLabel.text = helloLabel.text! + " " + newPerson.person
            addData(newPerson)
        }
    }
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var nameTextfield: UITextField!
    
// Data structure
    struct StringData {
// Poperties of structure
        var text: String
    }
    
    struct PersonData {
        var person: String
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
// Calls useData() function
        useData()
// nav is a helper variable referring to navBar in navController (saves typing)
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.Black
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
// Uses data structure
    func useData() -> String {
// Create constant of type StringData structure with text inside it assigned "Hello with data!"
        let helloData = StringData(text: "Hello")
// print helloData's text property.
// Remember helloData is an instance of StringData which contains a text property.
// HeloData inherits the text property and creates its own instance.
        print(helloData.text)
        return helloData.text
    }
    
    func addData(person: PersonData) {
        data.append(person.person)
        print(data)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.destinationViewController is PeopleTableViewController {
            let vc = segue.destinationViewController as? PeopleTableViewController
            vc?.dataCopy = data
        }
    }
}

