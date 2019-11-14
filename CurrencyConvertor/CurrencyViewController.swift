//
//  ViewController.swift
//  currencyconverter
//
//  Created by MacStudent on 2019-11-08.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class CurrencyViewController : UIViewController
{
   

    
    @IBOutlet weak var TextField: UITextField!  //Enter Amount
    
    @IBOutlet weak var Label1: UILabel!  // First Currency
    @IBOutlet weak var Label2: UILabel!  // Second Currency
    @IBOutlet weak var Label3: UILabel!  // Default Rate
    @IBOutlet weak var Label4: UILabel!  // Result
    
    @IBOutlet weak var Image1: UIImageView!
    @IBOutlet weak var Image2: UIImageView!
    
    var check = true
    
    var value:String! = "USD"
    var value1:String! = "INR"
    
override func viewDidLoad() {
    super.viewDidLoad()
    addDoneButtonOnKeyboard()
    
    // Do any additional setup after loading the view.
}
    
    @IBAction func unwindone(_ sender: UIStoryboardSegue) {
        
        guard let vc = sender.source as? CountryListViewController  else{return}
        if(check){
        Label1.text = vc.val
            
            switch Label1.text{
                
            case "USD" :
                Image1.image = #imageLiteral(resourceName: "usa")
                break
                
            case "INR" :
                 Image1.image = #imageLiteral(resourceName: "India")
                break
                
            case "EUR" :
                 Image1.image = #imageLiteral(resourceName: "Euro.jpg")
                break
                
            case "CAD" :
                 Image1.image = #imageLiteral(resourceName: "canada")
                break
                
            default:
                break
            }
            
        }else{
            Label2.text = vc.val
            
            switch Label2.text{
                
            case "USD" :
                Image2.image = #imageLiteral(resourceName: "usa")
                break
                
            case "INR" :
                Image2.image = #imageLiteral(resourceName: "India")
                break
                
            case "EUR" :
                Image2.image = #imageLiteral(resourceName: "Euro")
                break
                
            case "CAD" :
                Image2.image = #imageLiteral(resourceName: "canada")
                break
                
            default:
                break
            }
        }
        
        
        
        
    }
    @IBAction func ChangeButton1(_ sender: Any) // First Currency Change
        
    {
        check = true
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CountryListViewController") as? CountryListViewController
        self.navigationController?.pushViewController(vc!, animated: true)
        
//        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CountryListViewController") as? CurrencyTableViewController {
//
//            if let navigator = navigationController {
//                navigator.pushViewController(viewController, animated: true)
//            }
//        }
        
    }
    @IBAction func ChangeButton2(_ sender: Any)  // Second Currency Change
    {
        check = false
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CountryListViewController") as? CountryListViewController
        self.navigationController?.pushViewController(vc!, animated: true)
        
//        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CountryListViewController") as? CurrencyTableViewController {
//
//            if let navigator = navigationController {
//                navigator.pushViewController(viewController, animated: true)
//            }
//        }
        
        
    }
    
    @IBAction func changeButton3(_ sender: Any) // Default Rate Change
    {
    }
    
    @IBAction func ConvertButton(_ sender: Any) // Convert the given currency
    {
        
        
        if TextField.text == ""
        {
            
            return
        }
        
//            var amt:Double! = Double(Label1.text!)
            var amt:Double! = Double(TextField.text!)
        
            let usdinr = 71.58
            let usdcad = 1.32
            let usdeur = 0.91
            
            let inrcad = 0.018
            let inreur = 0.013
            
            let cadeur = 0.69
            
            switch Label1.text{
                
            case "USD":
                
                switch Label2.text{
                case "USD":
                    amt = amt * 1
                    break
                    
                case "INR":
                    amt = amt * usdinr
                    break
                    
                case "CAD":
                    amt = amt * usdcad
                    break
                    
                case "EUR":
                    amt = amt * usdeur
                    break
                    
                default:
                    break
                }
                
                break
                
            case "INR":
                
                switch Label2.text{
                case "USD":
                    amt = amt * 1/usdinr
                    break
                    
                case "INR":
                    amt = amt * 1
                    break
                    
                case "CAD":
                    amt = amt * inrcad
                    break
                    
                case "EUR":
                    amt = amt * inreur
                    break
                    
                default:
                    break
                }
                
                break
                
            case "CAD":
                
                switch Label2.text{
                case "USD":
                    amt = amt * 1/usdcad
                    break
                    
                case "INR":
                    amt = amt * 1/inrcad
                    break
                    
                case "CAD":
                    amt = amt * 1
                    break
                    
                case "EUR":
                    amt = amt * cadeur
                    break
                    
                default:
                    break
                }
                
                break
                
            case "EUR":
                
                switch Label2.text{
                case "USD":
                    amt = amt * 1/usdeur
                    break
                    
                case "INR":
                    amt = amt * 1/inreur
                    break
                    
                case "CAD":
                    amt = amt * 1/cadeur
                    break
                    
                case "EUR":
                    amt = amt * 1
                    break
                    
                default:
                    break
                }
                
                break
                
            default:
                break
            }
            
            Label4.text = String(amt)
        }
        
        
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        Label1.text = value
        
        Label2.text = value1
        
        switch Label1.text{
            
        case "USD" :
            Image1.image = #imageLiteral(resourceName: "usa")
            break
            
        case "INR" :
            Image1.image = #imageLiteral(resourceName: "India")
            break
            
        case "EUR" :
            Image1.image = #imageLiteral(resourceName: "Euro")
            break
            
        case "CAD" :
            Image1.image = #imageLiteral(resourceName: "canada")
            break
            
        default:
            break
        }
        
        switch Label2.text{
            
        case "USD" :
            Image2.image = #imageLiteral(resourceName: "usa")
            break
            
        case "INR" :
            Image2.image = #imageLiteral(resourceName: "India")
            break
            
        case "EUR" :
            Image2.image = #imageLiteral(resourceName: "Euro")
            break
            
        case "CAD" :
            Image2.image = #imageLiteral(resourceName: "canada")
            break
            
        default:
            break
        }
        
        
        
    }
    
}

extension CurrencyViewController {



func addDoneButtonOnKeyboard(){

    let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))

    doneToolbar.barStyle = .default



    let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)

    let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))



    let items = [flexSpace, done]

    doneToolbar.items = items

    doneToolbar.sizeToFit()



    TextField.inputAccessoryView = doneToolbar

}



@objc func doneButtonAction(){

   TextField.resignFirstResponder()
}
}
