//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 繁永 直希 on 2019/04/16.
//  Copyright © 2019 naoki.shigenaga. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var img:Int = 0
    
    //表示されている画像番号
    var dispImageNo = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //表示されている画像番号を元に画像を表示する
        func displayImage(){
            //画像の配列
            let imageNameArray = [
                "norimono_character6_shinkansen",
                "war_character_helicopter",
                "war_character_sensya",
                ]
            
            //表示している画像番号から名前を取り出し
            let name = imageNameArray[img]
            
            //画像を読み込む
            let image = UIImage(named: name)
            
            //Image Viewに読み込んだ画像をセット
            imageView.image = image
            imageView.contentMode = UIView.ContentMode.scaleAspectFit
            print("Date2 \(dispImageNo)") // デバッグ用
            
            
            
            //テスト表示
            // バンドルした画像ファイルを読み込み
            let image2 = UIImage(named: "norimono_character6_shinkansen")
            
            // Image Viewに画像を設定
            imageView.image = image2
        }
    }
    
    //戻るボタンの設定
    @IBAction func backButton(_ sender: Any) {
    
        self.dismiss(animated: true, completion: nil)
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
