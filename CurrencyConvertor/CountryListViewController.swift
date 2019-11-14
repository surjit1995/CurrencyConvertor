//
//  CurrencyTableViewController.swift
//  currencyconverter
//
//  Created by MacStudent on 2019-11-08.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit


class CountryListViewController : UITableViewController
{
    var val:String = "USD"
    
   
    
    let CountryNames = ["USD" , "INR" , "EUR" , "CAD"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

      
    }
      override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }


        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        {
            return CountryNames.count
        }
    
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell
        {
        let cell = tableView.dequeueReusableCell(
        withIdentifier: "cell",for: indexPath)
            //cell.textLabel?.text = "hgjghjghj"
            cell.textLabel?.text = CountryNames[indexPath.row]
            return cell
        }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
        self.val = CountryNames[indexPath.row]
        
    }
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is CurrencyViewController
        {
            let vc = segue.destination as? CurrencyViewController
            if(vc!.check){
                vc?.value = self.val
            } else{
                vc?.value1 = self.val
            }
            
        }    }
    @IBAction func Done(_ sender: Any) {
        _ = navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func can(_ sender: Any) {
         _ = navigationController?.popToRootViewController(animated: true)
    }
}
