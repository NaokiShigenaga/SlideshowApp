
//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 繁永 直希 on 2019/04/12.
//  Copyright © 2019 naoki.shigenaga. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slideView: UIImageView!
    
    //再生
    @IBAction func playPicture(_ sender: Any) {
    }
    
    //戻る
    @IBAction func backPicture(_ sender: Any) {
        //表示されている画像番号から１減らす
        dispImageNo -= 1
        //表示されている画像の番号を元に画像を表示する
        displayImage()
    }
    
    //進む
    @IBAction func nextPicture(_ sender: Any) {
        //表示されている画像番号から１増やす
        dispImageNo += 1
        //表示されている画像の番号を元に画像を表示する
        displayImage()
    }
    
    //表示されている画像番号
    var dispImageNo = 0
    
    //表示されている画像番号を元に画像を表示する
    func displayImage(){
        //画像の配列
        let imageNameArray = [
            "norimono_character6_shinkansen",
            "war_character_helicopter",
            "war_character_sensya",
        ]
        
        //範囲より下を指している場合、最後の画像を表示
        if dispImageNo < 0 {
            dispImageNo = 2
        }
        
        //範囲より上を指している場合、最初の画像を表示
        if dispImageNo > 2 {
            dispImageNo = 0
        }
        
        //表示している画像番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        
        //画像を読み込む
        let image = UIImage(named: name)
        
        //Image Viewに読み込んだ画像をセット
        slideView.image = image
        //slidePicture.image = image
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let image = UIImage(named: "norimono_character6_shinkansen")
        print("ImageDate1 \(image)") // デバッグ用
        slideView.image = image
        //slidePicture.image = image
        print("ImageDate2 \(image)") // デバッグ用
        
    }

}

