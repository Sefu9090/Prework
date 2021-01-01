//
//  SettingsViewController.swift
//  Prework
//
//  Created by Saul Fernandez on 12/29/20.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var slider1: UISlider!
    @IBOutlet weak var slider2: UISlider!
    @IBOutlet weak var slider3: UISlider!
    @IBOutlet weak var tip1: UILabel!
    @IBOutlet weak var tip2: UILabel!
    @IBOutlet weak var tip3: UILabel!
    
    let defaults = UserDefaults.standard
    
//    class UserDefaults : NSObject{
//        var percent1: Int
//        var percent2: Int
//        var percent3: Int
//
//        override init() {
//            self.percent1 = 10
//            self.percent2 = 15
//            self.percent3 = 20
//        }
//        
//
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        let percentNum1 = defaults.object(forKey: "percent1") as? Float
        let percentNum2 = defaults.object(forKey: "percent2") as? Float
        let percentNum3 = defaults.object(forKey: "percent3") as? Float
        tip1.text = String(format: "%.0f%%", (percentNum1 ?? 15) )
        tip2.text = String(format: "%.0f%%", (percentNum2 ?? 18))
        tip3.text = String(format: "%.0f%%", (percentNum3 ?? 20) )
        slider1.value = percentNum1 ?? 15
        slider2.value = percentNum2 ?? 18
        slider3.value = percentNum3 ?? 20
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("setting values")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    

    @IBAction func updatetip(_ sender: Any) {
        tip1.text = String(format: "%.0f%%", slider1.value)
        tip2.text = String(format: "%.0f%%", slider2.value)
        tip3.text = String(format: "%.0f%%", slider3.value)
        
        defaults.set(Int(slider1.value), forKey: "percent1")
        defaults.set(Int(slider2.value), forKey: "percent2")
        defaults.set(Int(slider3.value), forKey: "percent3")
    }
    @IBAction func returnDefaults(_ sender: Any) {
        slider1.value = 15
        slider2.value = 18
        slider3.value = 20
        
        tip1.text = String(format: "%.0f%%", slider1.value)
        tip2.text = String(format: "%.0f%%", slider2.value)
        tip3.text = String(format: "%.0f%%", slider3.value)
        
        defaults.set(Int(slider1.value), forKey: "percent1")
        defaults.set(Int(slider2.value), forKey: "percent2")
        defaults.set(Int(slider3.value), forKey: "percent3")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // ViewController.swift
}


