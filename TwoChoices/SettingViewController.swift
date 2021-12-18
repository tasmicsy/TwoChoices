//
//  SettingViewController.swift
//  TwoChoices
//
//  Created by Sae Obata on 2021/12/15.
//

import UIKit

class SettingViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var peopleTextField: UITextField!
    @IBOutlet weak var thingsTextField: UITextField!
    @IBOutlet weak var sentenceLabel: UILabel!
    @IBOutlet weak var returnButton: UIButton!

    var doOrDontText = "する？"
    var sentence = "私は勉強を・・"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .light
        
        pickerView.dataSource = self
        pickerView.delegate = self
        // Do any additional setup after loading the view.
        
        // MARK: - ボタンアレンジ
        // 1.角丸設定
                // UIButtonの変数名.layer.cornerRadius = 角丸の大きさ
        returnButton.layer.cornerRadius = 10

                // 2.影の設定
                // 影の濃さ
        returnButton.layer.shadowOpacity = 0.7
                // 影のぼかしの大きさ
        returnButton.layer.shadowRadius = 3
                // 影の色
        returnButton.layer.shadowColor = UIColor.black.cgColor
                // 影の方向（width=右方向、height=下方向）
        returnButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func peopleEditingChanged(_ sender: UITextField) {
        changeLabel()
    }
    
    
    @IBAction func thingsEditingChanged(_ sender: UITextField) {
        changeLabel()
    }
    


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "unwindToTop" {
            let topVC = segue.destination as! ViewController
            topVC.topLabel.text = sentence
            topVC.doOrDontButton.setTitle(doOrDont[rowGlobal][0], for: .normal)
            topVC.doOrDontButton.titleLabel?.adjustsFontSizeToFitWidth = true

        }
    }
    func changeLabel(){
        var people = peopleTextField.text ?? "私"
        people = people == "" ? "私" : people
        var things = thingsTextField.text ?? "勉強"
        things = things == "" ? "勉強" : things

        sentenceLabel.text = "\(people)は\(things)を\(doOrDontText)"
        sentence = "\(people)は\(things)を・・"
        
    }
    
    // MARK: - PickerView Arrange
    

    
    // UIPickerViewの列の数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
     
    // UIPickerViewの行数、要素の全数
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        return doOrDont.count
    }
     
    // UIPickerViewに表示する配列
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        
        return doOrDont[row][0]
    }
     
    // UIPickerViewのRowが選択された時の挙動
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        rowGlobal = row
        doOrDontText = doOrDont[row][1]
        changeLabel()
        // 処理
    }

}
