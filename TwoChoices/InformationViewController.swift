//
//  InformationViewController.swift
//  TwoChoices
//
//  Created by Sae Obata on 2021/12/18.
//

import UIKit
import MessageUI

class InformationViewController: UIViewController, MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func twitterTapped(_ sender: UIButton) {
            let url = URL(string: "https://twitter.com/molaworker")!
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
    @IBAction func mailTapped(_ sender: UIButton) {
        composeMail()
        }
    @IBAction func blogTapped(_ sender: UIButton) {
            let url = URL(string: "https://www.mechengjp.com/")!
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
    
    @IBAction func policyTapped(_ sender: UIButton) {
            let url = URL(string: "https://www.mechengjp.com/?page_id=1194")!
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
    
    func composeMail(){
        //メール送信が可能なら
        if MFMailComposeViewController.canSendMail() {
            //MFMailComposeVCのインスタンス
            let mail = MFMailComposeViewController()
            //MFMailComposeのデリゲート
            mail.mailComposeDelegate = self
            //送り先
            mail.setToRecipients(["molaworker.swift@gmail.com"])
            //Cc
            //mail.setCcRecipients(["mike@gmail.com"])
            //Bcc
            //mail.setBccRecipients(["amy@gmail.com"])
            //件名
            mail.setSubject("")
            //メッセージ本文
            mail.setMessageBody("", isHTML: false)
            //メールを表示
            self.present(mail, animated: true, completion: nil)
        //メール送信が不可能なら
        } else {
            //アラートで通知
            let alert = UIAlertController(title: "メールアプリ起動不可", message: "有効なメールアプリでmolaworker.swift@gmail.comにご連絡ください。", preferredStyle: .alert)
            let dismiss = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(dismiss)
            self.present(alert, animated: true, completion: nil)
        }
    }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {

               controller.dismiss(animated: true, completion: nil)
           }

}
