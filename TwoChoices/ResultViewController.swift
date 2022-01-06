//
//  ResultViewController.swift
//  TwoChoices
//
//  Created by Sae Obata on 2021/12/15.
//

import UIKit
import GoogleMobileAds
import UserMessagingPlatform

class ResultViewController: UIViewController, GADBannerViewDelegate {
    var bannerView: GADBannerView!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var doOrDontLabel: UILabel!
    
    @IBOutlet weak var imageLabel: UILabel!
    let doOrDontArray = [doOrDont[rowGlobal][2], doOrDont[rowGlobal][3]]
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // MARK: - ads
        // In this case, we instantiate the banner with desired ad size.

        
           bannerView = GADBannerView(adSize: GADAdSizeBanner)
        
        bannerView.adUnitID = "ca-app-pub-3014443422203887/4253023511"
        bannerView.rootViewController = self
        bannerView.delegate = self
           addBannerViewToView(bannerView)
    


        bannerView.load(GADRequest())
        
        doOrDontLabel.text = doOrDontArray.randomElement()
        if doOrDontLabel.text == doOrDont[rowGlobal][2] {
            imageLabel.text = "○"
            imageLabel.textColor = UIColor(red: 0.91, green: 0.94, blue: 0.95, alpha: 1.00)
            view.backgroundColor = UIColor(red: 0.22, green: 0.64, blue: 0.86, alpha: 1.00)
            doOrDontLabel.textColor = UIColor(red: 0.91, green: 0.94, blue: 0.95, alpha: 1.00)
            okButton.backgroundColor = UIColor(red: 0.91, green: 0.94, blue: 0.95, alpha: 1.00)
        }
        if doOrDontLabel.text == doOrDont[rowGlobal][3] {
            
            imageLabel.text = "×"
            imageLabel.textColor = UIColor(red: 0.94, green: 0.82, blue: 0.56, alpha: 1.00)
            view.backgroundColor = UIColor(red: 0.47, green: 0.11, blue: 0.26, alpha: 1.00)
            //UIColor(red: 0.64, green: 0.26, blue: 0.24, alpha: 1.00)
            doOrDontLabel.textColor = UIColor(red: 0.94, green: 0.82, blue: 0.56, alpha: 1.00)
        
            okButton.configuration?.title = "Title"
            okButton.backgroundColor = UIColor(red: 0.94, green: 0.82, blue: 0.56, alpha: 1.00)
            okButton.titleLabel?.textColor = UIColor(red: 0.47, green: 0.11, blue: 0.26, alpha: 1.00)
        }
        
        // MARK: - ボタンアレンジ
        // 1.角丸設定
                // UIButtonの変数名.layer.cornerRadius = 角丸の大きさ
        okButton.layer.cornerRadius = 10

                // 2.影の設定
                // 影の濃さ
        okButton.layer.shadowOpacity = 0.7
                // 影のぼかしの大きさ
        okButton.layer.shadowRadius = 3
                // 影の色
        okButton.layer.shadowColor = UIColor.black.cgColor
                // 影の方向（width=右方向、height=下方向）
        okButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        // Do any additional setup after loading the view.
        // Do any additional setup after loading the view.
    }
    
    func addBannerViewToView(_ bannerView: GADBannerView) {
      bannerView.translatesAutoresizingMaskIntoConstraints = false
      view.addSubview(bannerView)
      view.addConstraints(
        [NSLayoutConstraint(item: bannerView,
                            attribute: .bottom,
                            relatedBy: .equal,
                            toItem: view.safeAreaLayoutGuide,
                            attribute: .bottom,
                            multiplier: 1,
                            constant: 0),
         NSLayoutConstraint(item: bannerView,
                            attribute: .centerX,
                            relatedBy: .equal,
                            toItem: view,
                            attribute: .centerX,
                            multiplier: 1,
                            constant: 0)
        
        ])
     }
    
    func bannerViewDidReceiveAd(_ bannerView: GADBannerView) {
      print("bannerViewDidReceiveAd")
    }

    func bannerView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: Error) {
      print("bannerView:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }

    func bannerViewDidRecordImpression(_ bannerView: GADBannerView) {
      print("bannerViewDidRecordImpression")
    }

    func bannerViewWillPresentScreen(_ bannerView: GADBannerView) {
      print("bannerViewWillPresentScreen")
    }

    func bannerViewWillDismissScreen(_ bannerView: GADBannerView) {
      print("bannerViewWillDIsmissScreen")
    }

    func bannerViewDidDismissScreen(_ bannerView: GADBannerView) {
      print("bannerViewDidDismissScreen")
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
