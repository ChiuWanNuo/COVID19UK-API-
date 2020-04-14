//
//  MainViewController.swift
//  COVID19UK(API)
//
//  Created by ChiuWanNuo on 08/04/2020.
//  Copyright © 2020 ChiuWanNuo. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var confirmednumberLabel: UILabel!
    @IBOutlet weak var deathnumberLabel: UILabel!
    @IBOutlet weak var testednumberLabel: UILabel!
    @IBOutlet weak var postrateLabel: UILabel!
    @IBOutlet weak var mortautyLabel: UILabel!
    @IBOutlet weak var negativenumberLabel: UILabel!
    @IBOutlet weak var curednumberLabel: UILabel!
    @IBOutlet weak var seriousnumderLabel: UILabel!
    
    var vriusInfo : Vrius?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()

        // Do any additional setup after loading the view.
    }
    
    func getData(){
        let urlStr = "https://api.covid19uk.live"
        if let url = URL(string: urlStr) {
            //print("Enter URL")
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                if let data = data{
                    do {
                        let vrius = try JSONDecoder().decode(Vrius.self, from: data)
                        self.vriusInfo = vrius
                        //print("did get")
                        
                        DispatchQueue.main.async {
                            if let confirmednumber = self.vriusInfo?.data[0].confirmed,
                               let deathnumber = self.vriusInfo?.data[0].death,
                               let testednumber = self.vriusInfo?.data[0].tested,
                               let negativenumber = self.vriusInfo?.data[0].negative,
                               let curednumber = self.vriusInfo?.data[0].cured,
                               let seriousnumber = self.vriusInfo?.data[0].serious {
                                self.confirmednumberLabel.text = "\(confirmednumber)"
                                self.deathnumberLabel.text = "\(deathnumber)"
                                self.testednumberLabel.text = "\(testednumber)"
                                self.negativenumberLabel.text = "\(negativenumber)"
                                self.curednumberLabel.text = "\(curednumber)"
                                self.seriousnumderLabel.text = "\(seriousnumber)"
                                self.postrateLabel.text = String(format: "%.2f", Double(Double(curednumber) / Double(testednumber) * 100)) + "%"
                                self.mortautyLabel.text = String(format: "%.2f", Double(Double(deathnumber) / Double(confirmednumber) * 100)) + "%"
                          
                            }
                       }
                        
                    }catch{
                        print(error)
                    }
               }
            }
            task.resume()
        }
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
