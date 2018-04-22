//
//  ViewController.swift
//  t2sWebview
//  
//  Created by Shree Thaanu on 4/21/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit
import Toast_Swift
class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
  
     //  This CollectionView hold the web views.
    @IBOutlet weak var MainCollectioView: UICollectionView!
   
    // This buttons clears the cache
    @IBOutlet weak var CacheClearAction: UIButton!
    
    //  This array saves the url to be displayed
    var WebviewArray =  ["https://www.google.com","https://t2scareers.com/","https://www.youtube.com", "https://t2scareers.com/", "https://www.linkedin.com", "https://www.google.com"]
    
    var iscachecleared: String!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Timer for checking internet connectivity
        _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.checkInternet), userInfo: nil, repeats: true)
    }
   
    //    This button action is for clearing cookies
    @IBAction func clearCache(_ sender: Any) {
        URLCache.shared.removeAllCachedResponses()
        URLCache.shared.diskCapacity = 0
        URLCache.shared.memoryCapacity = 0
        UserDefaults.standard.set("yes", forKey: "Cachekey")
        self.view.makeToast("Cache cleared Successfully", duration: 3.0, position: .bottom)
        if let cookies = HTTPCookieStorage.shared.cookies {
            for cookie in cookies {
                HTTPCookieStorage.shared.deleteCookie(cookie)
            }
        }
    }
    
   // This function checks the internet connectivity
    func checkInternet(){
        
        if Reachability.isConnectedToNetwork() == true {
            print("Internet connection OK")
            UserDefaults.standard.set("", forKey: "Cachekey")
        } else {
            print("Internet connection FAILED")
            iscachecleared = UserDefaults.standard.string(forKey: "Cachekey")
            if iscachecleared == "yes" {
               self.view.makeToast("Internet connection disabled - Cache not found", duration: 3.0, position: .bottom)
            }
            else {
            self.view.makeToast("Internet connection disabled - Loading from cache", duration: 3.0, position: .bottom)
        }
        }
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    /// Collection View Delegates
    ///
    /// - Parameters:
    ///   - collectionView: This colection view displays the webviews in the home page.
    /// - Returns: cell with webview and count of urls.
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return WebviewArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        // Cells is the dequeueReusableCell initialization
        let cells = collectionView.dequeueReusableCell(withReuseIdentifier: "baseCollectionViewCell", for: indexPath) as! baseCollectionViewCell
      
        // This request takes the url from the array and save as cache.
        let url = URL(string: WebviewArray[indexPath.row])!
        var urlRequest = URLRequest(url: url)
        urlRequest.cachePolicy = .returnCacheDataElseLoad
        cells.listWebView.loadRequest(urlRequest)
        return cells
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let cell:baseCollectionViewCell = cell as! baseCollectionViewCell
        cell.collectionViewDisplayAnimation()
    }
}

