//
//  ViewController.swift
//  Exam1
//
//  Created by Kirolos Agayby on 3/28/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    

    @IBOutlet var NameInput: UITextField!
    @IBOutlet var PNumberInput: UITextField!
    @IBOutlet var table: UITableView!
    
    var Name: String = ""
    var PNumber: String = ""
    
    var data: [(name: String, PNumber: String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        // Do any additional setup after loading the view.
        
        
    }
    @IBAction func AddNewContact(_ sender: Any) {
        Name = String(NameInput.text!)
        PNumber = String(PNumberInput.text!)
        PNumberInput.text = PNumber
        data.append((name: Name, PNumber: PNumber))
        table.reloadData()
    }
    
    @IBAction func clearContacts(_ sender: Any) {
        data.removeAll()
        table.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].name
        cell.detailTextLabel?.text = data[indexPath.row].PNumber
        return cell
    }

}

