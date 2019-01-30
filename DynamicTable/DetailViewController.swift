//
//  DetailViewController.swift
//  DynamicTable
//
//  Created by Faical Sawadogo1212 on 01/12/19.
//  Copyright © 2019 Faical Sawadogo1212. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var number: UITextField!
    @IBOutlet weak var date: UILabel!
    
    var selectedRow: Int?
    var item: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        // Set name
        name.text = item?.name
        
        // Set number
        if let num = item?.number {
            number.text = String(num)
        }
        else {
            number.text = ""
        }
        
        // Set date
        if let theDate = item?.date {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
            let dateString = dateFormatter.string(from: theDate as Date)
            
            date.text = dateString
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // Save the name
        item?.name = name.text!
        
        // Save the number
        item?.number = Int(number.text!)
    }

}
