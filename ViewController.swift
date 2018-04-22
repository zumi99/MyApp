//
//  ViewController.swift
//  MyApp
//
//  Created by zumi on 2018/04/14.
//  Copyright © 2018年 zumi. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {


    @IBOutlet weak var image1: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        let url:String = "http://weather.livedoor.com/forecast/webservice/json/v1?city=130010"
        Alamofire.request(url, method: .get, encoding: JSONEncoding.default).responseJSON{ response in
            
            switch response.result {
            case .success:
                let json:JSON = JSON(response.result.value ?? kill)
                print(json["title"])
                print(json["description"]["text"])
                //self.showWeatherAlert(title: json["title"].stringValue,message: json["description"]["text"].stringValue)
            case .failure(let error):
                print(error)
            }
        }
        let img = UIImage(named: "icon_106690_64")
        self.image1.image = img

        let pictureURL = URL(string: "https://www.google.co.jp/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png")
        
        let session = URLSession(configuration: .default)
        
        let downloadTask = session.dataTask(with: pictureURL!) { (data, response, error) in
            if let e = error {
                print("download error")
            } else {
                if let res = response as? HTTPURLResponse {
                    print(res.statusCode)
                    if let imageData = data {
                        let googleImage = UIImage(data: imageData)
                        print(googleImage!)
                        //self.image1.image = googleImage
                        
                    } else {
                        print("imageData error")
                    }
                } else {
                    print("response error")
                }
            }
        }
        downloadTask.resume()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

