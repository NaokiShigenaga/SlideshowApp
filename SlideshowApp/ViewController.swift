
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
    
    @IBOutlet weak var backPicture: UIButton!
    
    @IBOutlet weak var playPicture: UIButton!
    
    @IBOutlet weak var nextPicture: UIButton!
    
    //一定間隔で処理を行うためのタイマー設定
    var timer: Timer!
    
    // タイマー用の時間のための変数
    var timer_sec: Float = 0
    
    // selector: #selector(updatetimer(_:)) で指定された関数
    // timeInterval: 0.1, repeats: true で指定された通り、0.1秒毎に呼び出され続ける
    @objc func updateTimer(_ timer: Timer) {
        self.timer_sec += 0.1
        //表示されている画像番号から１増やす
        dispImageNo += 1
        //表示されている画像の番号を元に画像を表示する
        displayImage()
    }

    
    //再生
    @IBAction func playPicture(_ sender: Any) {
        
        if self.timer == nil {
            //2秒で切り替わりを設定
            if self.timer == nil {
                self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            }
            //ボタンの無効化
            backPicture.isEnabled = false
            nextPicture.isEnabled = false
            
            //ボタンのタイトル変更
            playPicture.setTitle("一時停止", for: .normal) // ボタンのタイトル
            playPicture.setTitleColor(UIColor.red, for: .normal) // タイトルの色
        }else if self.timer != nil {
            //停止をする
            if self.timer != nil {
                self.timer.invalidate()
                self.timer = nil
            }
            //ボタンの有効化
            backPicture.isEnabled = true
            nextPicture.isEnabled = true
            
            //ボタンのタイトル変更
            playPicture.setTitle("再生", for: .normal) // ボタンのタイトル
            playPicture.setTitleColor(UIColor.black, for: .normal) // タイトルの色
            
        }
        
        
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
        //print("ImageDate1 \(image)") // デバッグ用
        slideView.image = image
        //print("ImageDate2 \(image)") // デバッグ用
        
    }
    
    
    //画像タップ、遷移先設定
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        // 遷移先のResultViewControllerで宣言しているx, yに値を代入して渡す
        resultViewController.img = dispImageNo
        print("Date \(dispImageNo)") // デバッグ用
        
        //遷移するときはタイマーストップをかける
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
        }
        
        //ボタンのタイトル変更
        playPicture.setTitle("再生", for: .normal) // ボタンのタイトル
        playPicture.setTitleColor(UIColor.black, for: .normal) // タイトルの色
        
        //ボタンの有効化
        backPicture.isEnabled = true
        nextPicture.isEnabled = true
    }
    
    @IBAction func onTapImage(_ sender: Any) {
    }

}

