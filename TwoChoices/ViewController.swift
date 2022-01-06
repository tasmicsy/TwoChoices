//
//  ViewController.swift
//  TwoChoices
//
//  Created by Sae Obata on 2021/12/15.
//

import UIKit
import GoogleMobileAds


class ViewController: UIViewController, GADBannerViewDelegate {

    
    
    var bannerView: GADBannerView!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var doOrDontButton: UIButton!

    @IBOutlet weak var informationButton: UIButton!
    

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        settingButton.contentHorizontalAlignment = .fill
        // MARK: - ads
        // In this case, we instantiate the banner with desired ad size.

        
           bannerView = GADBannerView(adSize: GADAdSizeBanner)
        
        bannerView.adUnitID = "ca-app-pub-3014443422203887/4253023511"
        bannerView.rootViewController = self
        bannerView.delegate = self
           addBannerViewToView(bannerView)
    


        bannerView.load(GADRequest())
        // MARK: - ボタンアレンジ
        // 1.角丸設定
                // UIButtonの変数名.layer.cornerRadius = 角丸の大きさ
        doOrDontButton.layer.cornerRadius = 10

                // 2.影の設定
                // 影の濃さ
        doOrDontButton.layer.shadowOpacity = 0.7
                // 影のぼかしの大きさ
        doOrDontButton.layer.shadowRadius = 3
                // 影の色
        doOrDontButton.layer.shadowColor = UIColor.black.cgColor
                // 影の方向（width=右方向、height=下方向）
        doOrDontButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        
    }
    @IBAction func unwind(_ seg: UIStoryboardSegue) {
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

}

