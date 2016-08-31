//
//  ViewController.swift
//  WeatherLayout
//
//  Created by TTB10912 on 30/08/2016.
//  Copyright © 2016 TTB10912. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbl_location: UILabel!
    @IBOutlet weak var lbl_C: UILabel!
    @IBOutlet weak var lbl_quote: UILabel!
    @IBOutlet weak var img_background: UIImageView!
    
    @IBOutlet weak var lbl_temp: UIButton!
    
    
    var cities = ["Hà Nội","Hồ Chí Minh","Đà Nẵng","Thái Bình" ]
    
    var quotes = [ "Fire is a good servant but a bad master","Old friends and old wine are best","A picture is worth a thousand words","Man proposes, God disposes"]
    var bgImage = [ "Sun","Moon","Blood"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tempRandom() -> Double {
        return Double(arc4random_uniform(18)+14) + Double(arc4random())/Double(INT32_MAX)
    }
    
    
    @IBAction func act_refresh(sender: AnyObject) {
        
        let citiesIndex = Int(arc4random_uniform(UInt32(cities.count)))
        lbl_location.text = cities[citiesIndex]
        
        let quotesIndex = Int(arc4random_uniform(UInt32(quotes.count)))
        lbl_quote.text = quotes[quotesIndex]
        
        let imIndex = Int(arc4random_uniform(UInt32(bgImage.count)))
        img_background.image = UIImage.init(named:bgImage[imIndex])
        
        getTemp()
        
        
    }
    @IBAction func act_changeTemp(sender: AnyObject) {
        cToF()
    }
    
    
    
    
    
    func getTemp() -> Void {
        let randomNum = String(format: "%2.1f", tempRandom())
        lbl_temp.titleLabel?.text = randomNum
        
    }
    func cToF()  {
        if lbl_C.text == "C" {
            
//            lbl_temp.titleLabel?.text = String(Double((lbl_temp.titleLabel?.text!)!)! * 1.8 + 32)
            
            lbl_temp.setTitle(String(format:"%2.1f" , (Double((lbl_temp.titleLabel?.text!)!)! * 1.8 + 32)), forState: .Normal)
            lbl_C.text = "F"
            
        } else{
        
        if lbl_C.text == "F" {
//            lbl_temp.titleLabel?.text = String((Double((lbl_temp.titleLabel?.text!)!)! - 32) / 1.8)
            lbl_temp.setTitle(String(format:"%2.1f" , ((Double((lbl_temp.titleLabel?.text!)!)! - 32) / 1.8)), forState: .Normal)
            lbl_C.text = "C"
        }
        }
        
       
    }

}

